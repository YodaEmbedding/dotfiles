import argparse
import json
import re
import sys
from dataclasses import dataclass
from collections import defaultdict, Counter
from pprint import pprint
from typing import Dict, List, Tuple

Entry = Tuple[str, str, List[str]]

core = {
    "audio": [
        "audacity.desktop",
        "mplayer.desktop",
        "mpv.desktop",
        "vlc.desktop",
    ],
    "image": [
        "eog.desktop",
        "geeqie.desktop",
        "gimp.desktop",
        "org.gnome.gThumb.desktop",
        "org.kde.gwenview.desktop",
        "photoqt.desktop",
        "qimgv.desktop",
        "viewnior.desktop",
    ],
    "text": [
        "neovim.desktop",
        "sublime_text.desktop",
        "visual-studio-code.desktop",
    ],
    "video": [
        "mplayer.desktop",
        "mpv.desktop",
        "org.gnome.gThumb.desktop",
        "svp-manager4.desktop",
        "vlc.desktop",
    ],
}


@dataclass
class Config:
    added: List[Entry]
    default: List[Entry]


def deserialize_config(text: str) -> Config:
    lines = text.splitlines()
    d = defaultdict(list)
    context = ""

    for line in lines:
        if line == "":
            continue
        if m := re.match(r"^\[(.*)\]$", line):
            context = m.group(1)
            continue
        if m := re.match(r"^([^/]+)/([^=]+)=(.*)$", line):
            mimetype, subtype, apps = m.groups()
            apps = apps.rstrip(";").split(";")
            d[context].append((mimetype, subtype, apps))
            continue

    added = sorted(d["Added Associations"])
    default = sorted(d["Default Applications"])
    return Config(added, default)


def serialize_entry(entry: Entry, trail_sep: bool = True) -> str:
    mimetype, subtype, apps = entry
    apps = ";".join(apps)
    if trail_sep:
        apps += ";"
    return f"{mimetype}/{subtype}={apps}"


def serialize_config(config: Config) -> str:
    lines = [
        "[Added Associations]",
        "\n".join(serialize_entry(x, trail_sep=True) for x in config.added),
        "",
        "[Default Applications]",
        "\n".join(serialize_entry(x, trail_sep=False) for x in config.default),
    ]
    return "\n".join(lines)


def count_mimeapp_list(mimeapp_list: List[Entry]) -> Dict[str, Counter]:
    d = defaultdict(list)
    for mimetype, _, apps in mimeapp_list:
        d[mimetype].extend(apps)
    return {mimetype: Counter(apps) for mimetype, apps in d.items()}


def best_defaults(config: Config):
    added = [(m, s, apps[0]) for m, s, apps in config.added]
    default = [(m, s, apps[0]) for m, s, apps in config.default]
    return {(m, s): a for m, s, a in added + default}


def sort_added(config: Config):
    added = []
    best = best_defaults(config)
    for mimetype, subtype, apps in config.added:
        head = best[(mimetype, subtype)]
        apps_tail = sorted([x for x in apps if x != head])
        apps = [head, *apps_tail]
        added.append((mimetype, subtype, apps))
    config.added = added


def main():
    parser = argparse.ArgumentParser(description="Preprocess mimeapps.list")
    parser.add_argument("file", help="File path")
    parser.add_argument("--inplace", "-i", action="store_true")
    args = parser.parse_args()

    with open(args.file) as f:
        text = f.read()

    f = sys.stdout if not args.inplace else open(args.file, "w")

    config = deserialize_config(text)
    sort_added(config)
    print(serialize_config(config), file=f)

    # Count
    # d = count_mimeapp_list(config.default)
    # d = {k: dict(sorted(v.items())) for k, v in d.items()}
    # print(json.dumps(d, indent=4))

    # Combine into single default list
    # best = best_defaults(config)
    # best = [serialize_entry((m, s, [a])) for (m, s), a in best.items()]
    # print("\n".join(best))

    # core[mimetype]


main()
