import argparse
import re
import sys


replacements = [
    ("&", "&amp;"),
    ("<!--", "<!&#45;&#45;"),
    ("-->", "&#45;&#45;>"),
    ("\n", "&#10;"),
]


def encode(s):
    for dec, enc in replacements:
        s = s.replace(dec, enc)
    return s


def decode(s):
    for dec, enc in reversed(replacements):
        s = s.replace(enc, dec)
    return s


def join(description, contents):
    return f"{description}\t<!-- {contents} -->"


def split(s):
    pattern = r"^([^\t]+)\t<!-- (.*) -->$"
    return re.match(pattern, s).groups()


def indent(xs):
    if isinstance(xs, str):
        xs = xs.splitlines()
    return "\n".join(f"  {x}" for x in xs)


def deindent(xs):
    if isinstance(xs, str):
        xs = xs.splitlines()
    return "\n".join(x[2:] for x in xs)


def decode_lines(lines, file):
    for line in lines:
        line = line.rstrip("\n")
        description, contents = split(line)
        contents = indent(decode(contents))
        print("# BEGIN", file=file)
        print(f"# {description}", file=file)
        print(contents, file=file)
        print("# END", file=file)
        print("", file=file)


def encode_lines(lines, file):
    state = "wait"
    description = ""
    contents_lines = []

    for line in lines:
        line = line.rstrip("\n")
        if line == "# BEGIN":
            state = "description"
            description = ""
            contents_lines = []
            continue
        if line == "# END":
            state = "wait"
            contents = encode(deindent(contents_lines))
            print(join(description, contents), file=file)
            continue
        if state == "description":
            state = "contents"
            description = line[2:]
            continue
        if state == "contents":
            contents_lines.append(line)
            continue


parser = argparse.ArgumentParser()
parser.add_argument(
    "in_file", nargs="?", type=argparse.FileType("r"), default=sys.stdin
)
parser.add_argument(
    "out_file", nargs="?", type=argparse.FileType("w"), default=sys.stdout
)
parser.add_argument("-d", action="store_true", help="Decode in_file")
parser.add_argument("-e", action="store_true", help="Encode in_file")
args = parser.parse_args()

in_file = args.in_file
out_file = args.out_file

if not args.d and not args.e:
    raise Exception("Please specify whether to encode or decode")

if args.d and args.e:
    raise Exception("Please specify only one of encode or decode flags")

if args.d:
    decode_lines(in_file, out_file)

if args.e:
    encode_lines(in_file, out_file)
