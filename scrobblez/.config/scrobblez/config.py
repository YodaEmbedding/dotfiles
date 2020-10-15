# pylint: disable=line-too-long

from scrobblez.metadata_filter import *
from scrobblez.types import Metadata

whitelist = [
    "spotify",
]

RULES = (
    REMASTERED_FILTER_RULES
    + SUFFIX_FILTER_RULES
    + VERSION_FILTER_RULES
    + ORIGIN_FILTER_RULES
    + FEATURE_FILTER_RULES
    + CLEAN_EXPLICIT_FILTER_RULES
    + LIVE_FILTER_RULES
    + TRIM_WHITESPACE_FILTER_RULES
)

# fmt: off
composers = [
    "Alban Berg",
    "Alexander Glazunov",
    "Alfred Schnittke",
    "Anton Bruckner",
    "Antonio Vivaldi",
    "Antón García Abril",
    "Aram Khachaturian",
    "Arnold Schönberg",
    "Béla Bartók",
    "Claude Debussy",
    "Dmitri Shostakovich",
    "Edgar Meyer",
    "Felix Mendelssohn",
    "Franz Liszt",
    "Franz Schubert",
    "Henri Vieuxtemps",
    "Igor Stravinsky",
    "Jennifer Higdon",
    "Johann Sebastian Bach",
    "Johannes Brahms",
    "Ludwig van Beethoven",
    "Max Bruch",
    "Niccolò Paganini",
    "Pyotr Ilyich Tchaikovsky",
    "Samuel Barber",
    "Sergei Prokofiev",
    "Sergei Rachmaninoff",
    "Wolfgang Amadeus Mozart",
]

artist_overrides = {
    "Yusuf": "Cat Stevens",
    "Yusuf / Cat Stevens": "Cat Stevens",
}

album_artist_overrides = {
    **artist_overrides
}

album_overrides = {
    "Frozen (Original Motion Picture Soundtrack)":
    "Frozen (Original Motion Picture Soundtrack)",
    "Frozen 2 (Original Motion Picture Soundtrack/Deluxe Edition)":
    "Frozen 2 (Original Motion Picture Soundtrack/Deluxe Edition)",
    "The Lord of the Rings - The Return of the King - The Complete Recordings (Limited Edition)":
    "The Lord of the Rings: Return of the King - the Complete Recordings",
}

title_overrides = {
    "A Change Of Seasons - The Crimson Sunrise / Innocence / Carpe Diem / The Darkest Of Winters / Another World / The Inevitable Summer / The Crimson Sunset":
    "A Change Of Seasons",
    "Better Get Hit In Your Soul - Instrumental":
    "Better Git It in Your Soul",
}

manual_overrides = {
    "artist": artist_overrides,
    "album_artist": album_artist_overrides,
    "album": album_overrides,
    "title": title_overrides,
}

override_various_artists = [
    "Howard Shore",
]

# fmt: on


def fix_metadata(metadata: Metadata) -> Metadata:
    m = dict(metadata)

    m["artist"], m["album_artist"] = _choose_artist(
        m["artist"], m["album_artist"]
    )

    _fix(m, "artist")
    _fix(m, "album_artist")
    _fix(m, "album", lambda x: apply_filters(RULES, x))
    _fix(m, "title", lambda x: apply_filters(RULES, x))

    # e.g. for Lord of the Rings, replace "Various Artists" with "Howard Shore"
    if m["album_artist"] == "Various Artists":
        if m["artist"] in override_various_artists:
            m["album_artist"] = m["artist"]

    return m


def _choose_artist(artists, album_artists):
    """Reduce list of artists to one artist."""
    artist = artists[0]
    xs = [x for x in album_artists if x not in composers]
    album_artist = xs[0] if len(xs) != 0 else album_artists[0]
    return artist, album_artist


def _fix(m, k, f=lambda x: x):
    m[k] = manual_overrides[k].get(m[k], f(m[k]))
