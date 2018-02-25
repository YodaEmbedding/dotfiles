import functools
import itertools
import math
import os
import sys

from functools import namedtuple, partial
from time import time, sleep
from timeit import timeit

import cv2
import matplotlib.pyplot as plt
import numpy as np

from numpy import array, arange
from numpy import exp, log, sqrt, ceil, floor
from numpy import pi, sin, cos, tan, arcsin, arccos, arctan, arctan2, degrees, radians
from scipy import optimize, signal

def E(x, precision=3): return ('{:.' + str(precision) + 'E}').format(x)


