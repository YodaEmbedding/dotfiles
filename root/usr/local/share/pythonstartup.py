import cmath
import functools
import itertools
import math
import os
import sys

from cmath import phase, polar
from functools import namedtuple, partial
from pprint import pprint
from time import time, sleep
from timeit import timeit

import cv2
import matplotlib.pyplot as plt
import numpy as np

from numpy import array, arange, concatenate, ones, ones_like, zeros, zeros_like
from numpy import exp, log, log2, log10, sqrt, ceil, floor
from numpy import pi, sin, cos, tan, arcsin, arccos, arctan, arctan2, degrees, radians
from scipy import optimize, signal
from scipy.constants import *

j = 1.j

np.set_printoptions(precision=3)

def E(x, precision=3):
    return ('{:.' + str(precision) + 'E}').format(x)

def print(*args):
    def reformat(x):
        return (
            "{:.3f}".format(x) if isinstance(x, float)   else
            "{:.3f}".format(x) if isinstance(x, complex) else
            x)
    __builtins__.print(*map(reformat, args))

def namestr(obj, namespace):
    return next(name for name in namespace if namespace[name] is obj)

def printn(*args, namespace=globals(), padding=20):
    for x in args:
        print(namestr(x, namespace).ljust(padding), x)
