import pkgutil
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

lazy_callable("datetime", "datetime")
lazy_callable("DictConfig", "omegaconf")
lazy_callable("OmegaConf", "omegaconf")
lazy_callable("DataFrame", "pandas")
lazy_callable("Path", "pathlib")
lazy_callable("Image", "PIL")
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
