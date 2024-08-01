import pkgutil
from collections import defaultdict
from importlib import import_module
from itertools import *
from pprint import pprint
from time import sleep
from timeit import timeit


class LazyModule:
    def __init__(self, alias, path):
        self._alias = alias
        self._path = path
        globals()[self._alias] = self

    def __getattr__(self, attr):
        module = import_module(self._path)
        globals()[self._alias] = module
        return getattr(module, attr)


class LazyObject:
    def __init__(self, alias, path, getattr=True):
        self._alias = alias
        self._path = path
        self._getattr = getattr
        globals()[self._alias] = self

    @property
    def _obj(self):
        module = import_module(self._path)
        obj = module
        if self._getattr:
            obj = getattr(obj, self._alias)
        globals()[self._alias] = obj
        return obj

    def __call__(self, *args, **kwargs):
        return self._obj(*args, **kwargs)

    def __getattr__(self, attr):
        if attr == "_obj":
            return super().__getattribute__(attr)
        obj = self._obj
        return getattr(obj, attr)

    def __getitem__(self, key):
        return self._obj[key]


def lazy_callable(alias, path):
    def inner(*args, **kwargs):
        module = import_module(path)
        func = getattr(module, alias)
        globals()[alias] = func
        return func(*args, **kwargs)

    globals()[alias] = inner


LazyModule("mpl", "matplotlib")
LazyModule("plt", "matplotlib.pyplot")
LazyModule("np", "numpy")
LazyModule("pd", "pandas")
LazyModule("pl", "polars")
LazyModule("sns", "seaborn")
LazyModule("tf", "tensorflow")
LazyModule("nn", "torch.nn")
LazyModule("F", "torch.nn.functional")

LazyObject("Image", "PIL.Image", getattr=False)

lazy_callable("datetime", "datetime")
lazy_callable("DictConfig", "omegaconf")
lazy_callable("OmegaConf", "omegaconf")
lazy_callable("DataFrame", "pandas")
lazy_callable("Path", "pathlib")
lazy_callable("Tensor", "torch")

modules = [x.name for x in pkgutil.iter_modules()]

for module in modules:
    if module in globals():
        continue
    LazyModule(alias=module, path=module)

try:
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

    np.set_printoptions(precision=3)

    def arange_(*shape, dtype=None):
        return np.arange(np.prod(shape), dtype=dtype).reshape(shape)

except ImportError:
    pass
