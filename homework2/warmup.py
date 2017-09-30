import math
import re
import random

def change(cents):
    if cents < 0:
        raise ValueError('amount cannot be negative')
    ans = [0] * 4
    i = 0
    for coin in [25, 10, 5, 1]:
        [ans[i], cents] = divmod(cents, coin)
        i += 1
    return tuple(ans)

def strip_quotes(str=''):
    return re.sub(r'[\"\'\\]', '', str)

def scramble(str):
    str_list = list(str)
    random.shuffle(str_list)
    return ''.join(str_list)

def strip_quotes(str):
    return 0

def say():
    return 0

def triples(hyp):
    return [(a, b, c) for c in range(1, hyp + 1) for b in range(1, c) for a in range(1, b) if a*a+b*b == c*c]

def powers(base, value):
    'use yield'
    return 0

def interleave(a, *b):
    return 0

class Cylinder:
    "A circle with a 2-D center point and a radius."
    def __init__(self, radius=1, height=1):
        self.height = height
        self.radius = radius
    @property
    def volume(self):
        "Returns the volume of the Cylinder"
        return math.pi * (self.radius ** 2) * self.height
    @property
    def surface_area(self):
        "Returns the surface area of the Cylinder"
        return (math.pi * self.radius * 2 * self.height) + (2 * math.pi * (self.radius ** 2))

    def widen(self, factor):
        "Increases the radius by the given factor"
        self.radius *= factor
        return self

    def stretch(self, factor):
        "Increases the radius by the given factor"
        self.height *= factor
        return self

def make_crypto_functions():
    return 0

def random_name(region=None, gender=None):

    return 0
