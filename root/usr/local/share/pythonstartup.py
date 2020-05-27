import functools
import itertools
import json
import math
import os
import re
import sys
from functools import partial
from importlib import import_module
from itertools import *
from pprint import pprint
from time import time, sleep
from timeit import timeit
from typing import *

import numpy as np
from numpy import array, arange, concatenate, ones, ones_like, zeros, zeros_like
from numpy import exp, log, log2, log10, sqrt, ceil, floor
from numpy import pi, sin, cos, tan, arcsin, arccos, arctan, arctan2, degrees, radians

np.set_printoptions(precision=3)

j = 1.j


class LazyModule:
    def __init__(self, alias, path):
        self._alias = alias
        self._path = path
        globals()[self._alias] = self

    def __getattr__(self, attr):
        module = import_module(self._path)
        globals()[self._alias] = module
        return getattr(module, attr)


def lazy_callable(alias, path):
    def inner(*args, **kwargs):
        module = import_module(path)
        func = getattr(module, alias)
        globals()[alias] = func
        return func(*args, **kwargs)

    globals()[alias] = inner


LazyModule("mpl", "matplotlib")
LazyModule("plt", "matplotlib.pyplot")
LazyModule("pd", "pandas")
LazyModule("sns", "seaborn")
LazyModule("tf", "tensorflow")

lazy_callable("DataFrame", "pandas")


def arange(*shape, dtype=None):
    return np.arange(np.prod(shape), dtype=dtype).reshape(shape)


def json_load(filename: str):
    with open(filename) as f:
        return json.load(f)


def json_dump(data: dict, filename: str):
    with open(filename, "w") as f:
        json.dump(data, f, indent=4)


def read_fwf(s: str, drop_first=True):
    from io import StringIO
    df = pd.read_fwf(StringIO(s))
    if drop_first:
        df.drop(df.columns[0], axis=1, inplace=True)
    return df


def h(x):
    help(x)
