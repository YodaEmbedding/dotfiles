#!/usr/bin/env python

# Author: Mateen Ulhaq <mulhaq2005 [at] gmail [dot] com>

import argparse
import json
import subprocess


def get_json(cmd):
    process = subprocess.run(cmd, check=True, capture_output=True, text=True)
    return json.loads(process.stdout)


def get_active_window_info():
    return get_json(cmd=["hyprctl", "activewindow", "-j"])


def get_windows():
    return get_json(cmd=["hyprctl", "clients", "-j"])


def get_workspaces():
    return get_json(cmd=["hyprctl", "workspaces", "-j"])


def get_monitors():
    return get_json(cmd=["hyprctl", "monitors", "-j"])


def move_window_pixel(x, y, address):
    cmd = [
        "hyprctl",
        "dispatch",
        "movewindowpixel",
        "exact",
        f"{x}",
        f"{y}" + f",address:{address}",
    ]
    subprocess.run(cmd)


def get_target_window_info(windows, workspaces, monitors, address):
    if not address:
        window_info = get_active_window_info()
        address = window_info["address"].strip('"')

    window_info = next(w for w in windows if w["address"] == address)
    workspace_info = next(
        w for w in workspaces if w["id"] == window_info["workspace"]["id"]
    )
    monitor_info = next(m for m in monitors if m["name"] == workspace_info["monitor"])

    return window_info, workspace_info, monitor_info


def compute_anchor(directions, width, height):
    assert sum(1 for d in directions if d in ["top", "middle", "bottom"]) <= 1
    assert sum(1 for d in directions if d in ["left", "center", "right"]) <= 1

    x, y = 0, 0  # Default to top left.

    if "left" in directions:
        x = 0
    if "center" in directions:
        x = width // 2
    if "right" in directions:
        x = width

    if "top" in directions:
        y = 0
    if "middle" in directions:
        y = height // 2
    if "bottom" in directions:
        y = height

    return x, y


def clip_bounds(x, y, window_info, bounds):
    window_width = window_info["size"][0]
    window_height = window_info["size"][1]
    if bounds["x_min"] is not None:
        x = max(x, bounds["x_min"])
    if bounds["x_max"] is not None:
        x = min(x + window_width, bounds["x_max"]) - window_width
    if bounds["y_min"] is not None:
        y = max(y, bounds["y_min"])
    if bounds["y_max"] is not None:
        y = min(y + window_height, bounds["y_max"]) - window_height
    return x, y


def parse_position_command(command, size, offset):
    if not command:
        return None
    if command[-1] == "%":
        position = float(command[:-1]) * size // 100
    else:
        position = float(command)
    if command[0] in ["+", "-"]:
        position += offset  # convert relative position to absolute
    return position


def compute_bounds(args, monitor_info):
    monitor_width = monitor_info["width"]
    monitor_height = monitor_info["height"]
    return {
        "x_min": parse_position_command(args.x_min, monitor_width, 0),
        "x_max": parse_position_command(args.x_max, monitor_width, 0),
        "y_min": parse_position_command(args.y_min, monitor_height, 0),
        "y_max": parse_position_command(args.y_max, monitor_height, 0),
    }


def compute_new_window_position(args, window_info, monitor_info, bounds):
    ref_dx, ref_dy = compute_anchor(
        args.anchor.split("_"), window_info["size"][0], window_info["size"][1]
    )

    if args.units == "monitor":
        unit_width = monitor_info["width"]
        unit_height = monitor_info["height"]
    else:
        x_min = bounds.get("x_min", 0)
        x_max = bounds.get("x_max", monitor_info["width"])
        y_min = bounds.get("y_min", 0)
        y_max = bounds.get("y_max", monitor_info["height"])
        unit_width = x_max - x_min
        unit_height = y_max - y_min
        ref_dx -= x_min
        ref_dy -= y_min

    x = window_info["at"][0] + ref_dx
    y = window_info["at"][1] + ref_dy

    x = parse_position_command(args.x or "+0", unit_width, x) - ref_dx
    y = parse_position_command(args.y or "+0", unit_height, y) - ref_dy

    x, y = clip_bounds(x, y, window_info, bounds)

    return int(x), int(y)


def build_parser():
    parser = argparse.ArgumentParser(description="Move the active window")
    parser.add_argument(
        "--address",
        default=None,
        help="Address of the target window. Default: active window.",
    )
    parser.add_argument(
        "--anchor",
        default="top_left",
        choices=[
            "top",
            "middle",
            "bottom",
            "left",
            "center",
            "right",
            "top_left",
            "top_center",
            "top_right",
            "middle_left",
            "middle_right",
            "middle_center",
            "bottom_left",
            "bottom_center",
            "bottom_right",
        ],
        help="Anchor point in window for determining position.",
    )
    parser.add_argument(
        "-x",
        "--x",
        help="x-coordinate to move the window to. Use +/- for delta, e.g. +10 for 10 pixels right.",
    )
    parser.add_argument(
        "-y",
        "--y",
        help="y-coordinate to move the window to. Use +/- for delta, e.g. +10 for 10 pixels down.",
    )
    parser.add_argument(
        "--x_min",
        default=None,
        help="Minimum x-coordinate for the window's left edge.",
    )
    parser.add_argument(
        "--x_max",
        default=None,
        help="Maximum x-coordinate for the window's right edge (exclusive).",
    )
    parser.add_argument(
        "--y_min",
        default=None,
        help="Minimum y-coordinate for the window's top edge.",
    )
    parser.add_argument(
        "--y_max",
        default=None,
        help="Maximum y-coordinate for the window's bottom edge (exclusive).",
    )
    parser.add_argument(
        "--units",
        default="monitor",
        choices=["monitor", "bounds"],
        help="Use %% units relative to monitor or viewport induced by x/y_min/max.",
    )
    # TODO --width, --height
    return parser


def main():
    parser = build_parser()
    args = parser.parse_args()

    windows = get_windows()
    workspaces = get_workspaces()
    monitors = get_monitors()

    window_info, _, monitor_info = get_target_window_info(
        windows, workspaces, monitors, args.address
    )

    # if not window_info["floating"]:
    #     return

    bounds = compute_bounds(args, monitor_info)
    x, y = compute_new_window_position(args, window_info, monitor_info, bounds)
    print(f"Moving window to ({x}, {y}).")
    move_window_pixel(x, y, window_info["address"])


if __name__ == "__main__":
    main()


# TODO resizing windows
