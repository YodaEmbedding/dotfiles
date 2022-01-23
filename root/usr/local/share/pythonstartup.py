import json
import pkgutil
from importlib import import_module
from itertools import *
from pprint import pprint
from time import sleep, time
from timeit import timeit

import numpy as np
from numpy import (
    arange,
    arccos,
    arcsin,
    arctan,
    arctan2,
    array,
    ceil,
    concatenate,
    cos,
    degrees,
    exp,
    floor,
    log,
    log2,
    log10,
    ones,
    ones_like,
    pi,
    radians,
    sin,
    sqrt,
    tan,
    zeros,
    zeros_like,
)


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

modules = [x.name for x in pkgutil.iter_modules()]

for module in modules:
    if module in globals():
        continue
    LazyModule(alias=module, path=module)


def arange_(*shape, dtype=None):
    return np.arange(np.prod(shape), dtype=dtype).reshape(shape)


np.set_printoptions(precision=3)
j = 1.0j
A = array
R = arange_


def read(filename: str):
    with open(filename) as f:
        return f.read()


def json_load(filename: str):
    with open(filename) as f:
        return json.load(f)


def json_dump(data: dict, filename: str):
    with open(filename, "w") as f:
        json.dump(data, f, indent=2)


json.loadf = json_load
json.dumpf = json_dump


def read_fwf(s: str, drop_first=True, **kwargs):
    from io import StringIO

    df = pd.read_fwf(StringIO(s), **kwargs)
    if drop_first:
        df.drop(df.columns[0], axis=1, inplace=True)
    return df
