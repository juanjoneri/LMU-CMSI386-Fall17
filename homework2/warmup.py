import math
import re
import random
import Crypto
from Crypto.Cipher import AES
import requests


def change(cents):
    if cents < 0:
        raise ValueError('amount cannot be negative')
    coin_count = []
    remaning_cents = cents
    for coin in [25, 10, 5, 1]:
        coin_count.append(remaning_cents // coin)
        remaning_cents = remaning_cents % coin
    return tuple(coin_count)


def strip_quotes(str):
    return re.sub(r'[\"\']', '', str)


def scramble(str):
    str_list = list(str)
    random.shuffle(str_list)
    return ''.join(str_list)


def say(str=''):
    phrase = str

    def say_more(new_str=''):
        nonlocal phrase
        if new_str == '':
            return phrase
        phrase = phrase + ' ' + new_str
        return say_more
    return phrase if str == '' else say_more


def triples(hypothenuse):
    values = [(a, b, c)
              for c in range(1, hypothenuse + 1)
              for b in range(1, c)
              for a in range(1, b)
              if a*a+b*b == c*c]
    # Sort by the first element to meet problem constraints
    return sorted(values, key=lambda triple: triple[0])


def powers(base, max):
    current_power, next_power = 1, 1
    while next_power <= max:
        current_power = next_power
        next_power = current_power * base
        yield current_power


def interleave(left, *right):
    # interleave the intersection of x and y
    intersection = [element for pair in zip(left, right) for element in pair]
    # Find out how many elements were missed
    leftover = len(left) - len(right)
    if leftover == 0:
        return intersection
    elif leftover > 0:
        return intersection + left[-leftover:]
    else:
        return intersection + list(right)[leftover:]


class Cylinder:
    def __init__(self, radius=1, height=1):
        self.height = height
        self.radius = radius

    @property
    def volume(self):
        return math.pi * (self.radius ** 2) * self.height

    @property
    def surface_area(self):
        return (math.pi * self.radius * 2 * self.height) + \
         (2 * math.pi * (self.radius ** 2))

    def widen(self, factor):
        self.radius *= factor
        return self

    def stretch(self, factor):
        self.height *= factor
        return self


def make_crypto_functions(key, iv):
    def encrypts(bytes):
        cipher = AES.new(key, AES.MODE_CBC, iv)
        return cipher.encrypt(bytes)

    def decrypts(bytes):
        cipher = AES.new(key, AES.MODE_CBC, iv)
        return cipher.decrypt(bytes)

    return tuple([encrypts, decrypts])


def random_name(gender=None, region=None):
    url = 'https://uinames.com/api/'
    kwargs = {'gender': gender, 'region': region, 'amount': '1'}
    response = requests.get(url, params=kwargs).json()
    if response.get('error') is None:
        return '{}, {}'.format(response.get('surname'), response.get('name'))
    raise ValueError(str(response))
