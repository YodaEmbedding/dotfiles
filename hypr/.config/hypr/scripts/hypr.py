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
