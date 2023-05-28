#!/usr/bin/env python3
# Author: Marcin Kocur, attribution license:
# https://creativecommons.org/licenses/by/4.0/

import os
import subprocess
import sys

env = os.environ
env["LANG"] = "en_US"
apps = [
    '"Spotify"',
    '"spotifyd"',
    '"psst-gui"',
]


def parse(text):
    pactl = text.strip().split()
    if not any(app in pactl for app in apps):
        return
    x = 0
    for e in pactl:
        x += 1
        if e in apps:
            break
    y = 0
    for i in pactl[0 : x - 1]:
        y += 1
        if i == "Sink" and pactl[y] == "Input" and "#" in pactl[y + 1]:
            sink_id = pactl[y + 1]
        if i == "Volume:" and "%" in pactl[y + 3]:
            volume = pactl[y + 3]
    sink_id = int(sink_id[1:])
    volume = int(volume[:-1])
    return sink_id, volume


# TODO
# def parse(text):
#     for line in text.splitlines():
#         m = re.match(r"^Sink Input #(?P<sink_id>\d+)$", line)
#         if m:
#             sink_id = m.group("sink_id")


def parse_pct(pct):
    assert pct[0] in ["+", "-"]
    assert pct[-1] == "%"
    return int(pct[:-1])


def main():
    cmd = ["pactl", "list", "sink-inputs"]
    text = subprocess.run(
        cmd, capture_output=True, check=True, text=True, env=env
    ).stdout

    sink_id, volume = parse(text)

    pct = sys.argv[1]
    target_volume = min(max(volume + parse_pct(pct), 0), 100)
    d_volume = target_volume - volume

    # print(sink_id, volume, target_volume)

    cmd = ["pactl", "set-sink-input-volume", f"{sink_id}", f"{d_volume:+}%"]
    subprocess.run(cmd)


if __name__ == "__main__":
    main()
