import math

# Basic arithmetic

def intAdd(a, b):
    return a + b

def intSub(a, b):
    return a - b

def intMult(a, b):
    return a * b

def intDiv(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def intMod(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a % b

def intPow(a, b):
    return a ** b

# Slightly more advanced functions

def intAbs(a):
    return abs(a)

def intSqrtFloor(a):
    return math.floor(math.sqrt(a))

# Radians & Degrees

def pi():
    return math.pi

def radToDeg(x):
    return x * 180 / pi()

def degToRad(x):
    return x * pi() / 180

def sinR(x):
    return math.sin(x)

def sinD(x):
    return math.sin(degToRad(x))

def cosR(x):
    return math.cos(x)

def cosD(x):
    return math.cos(degToRad(x))

def tanR(x):
    return math.tan(x)

def tanD(x):
    return math.tan(degToRad(x))

# Conversions

def strToInt(s):
    return int(s)