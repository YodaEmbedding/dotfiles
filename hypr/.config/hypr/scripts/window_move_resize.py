#!/usr/bin/env python

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


def get_window_snap_location(directions, window_info, monitor_info):
    assert sum(1 for d in directions if d in ["top", "middle", "bottom"]) <= 1
    assert sum(1 for d in directions if d in ["left", "center", "right"]) <= 1

    window_width = window_info["size"][0]
    window_height = window_info["size"][1]
    monitor_width = monitor_info["width"]
    monitor_height = monitor_info["height"]
    x = window_info["at"][0]
    y = window_info["at"][1]

    if "left" in directions:
        x = 0
    if "center" in directions:
        x = monitor_width // 2 - window_width // 2
    if "right" in directions:
        x = monitor_width - window_width

    if "top" in directions:
        y = 0
    if "middle" in directions:
        y = monitor_height // 2 - window_height // 2
    if "bottom" in directions:
        y = monitor_height - window_height

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
        return int(offset)
    if command[-1] == "%":
        position = float(command[:-1]) * size // 100
    else:
        position = float(command)
    if command[0] in ["+", "-"]:
        position += offset  # convert relative position to absolute
    return int(position)


def compute_bounds(args, monitor_info):
    monitor_width = monitor_info["width"]
    monitor_height = monitor_info["height"]
    parse_maybe = (
        lambda c, s, p: parse_position_command(c, s, p) if c is not None else None
    )
    return {
        "x_min": parse_maybe(args.x_min, monitor_width, 0),
        "x_max": parse_maybe(args.x_max, monitor_width, 0),
        "y_min": parse_maybe(args.y_min, monitor_height, 0),
        "y_max": parse_maybe(args.y_max, monitor_height, 0),
    }


def compute_new_window_position(args, window_info, monitor_info, bounds):
    if args.snap is not None:
        directions = args.snap.split("_")
        x, y = get_window_snap_location(directions, window_info, monitor_info)
        x, y = clip_bounds(x, y, window_info, bounds)
        return x, y

    x = parse_position_command(args.x, monitor_info["width"], window_info["at"][0])
    y = parse_position_command(args.y, monitor_info["height"], window_info["at"][1])
    x, y = clip_bounds(x, y, window_info, bounds)

    return x, y


def build_parser():
    parser = argparse.ArgumentParser(description="Move the active window")
    parser.add_argument(
        "--address",
        default=None,
        help="Address of the target window. Default: active window.",
    )
    parser.add_argument(
        "--snap",
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
        help="Location to snap the window.",
    )
    parser.add_argument(
        "--reference",
        default="top_left",
        choices=["top_left"],  # TODO support "center", etc
        help="Reference point in window for determining position.",
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


# TODO reference point
# Perhaps with reference point, "--snap" is not necessary?
# e.g. --reference=top_center --x=50% --y=0%
# e.g. --reference=bottom_right --x=100% --y=100%

# TODO resizing windows
