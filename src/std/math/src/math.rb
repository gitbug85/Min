
# Basic arithmetic

def intAdd(a, b)
  a + b
end

def intSub(a, b)
  a - b
end

def intMult(a, b)
  a * b
end

def intDiv(a, b)
  raise ArgumentError, "Cannot divide by zero" if b == 0

  a / b
end

def intMod(a, b)
  raise ArgumentError, "Cannot divide by zero" if b == 0

  a % b
end

def intPow(a, b)
  a ** b
end

# Slightly more advanced functions

def intAbs(a)
  a.abs
end

def intSqrtFloor(a)
  Math.sqrt(a).floor
end

# Radians & Degrees

def pi
  Math::PI
end

def radToDeg(x)
  x * 180 / pi
end

def degToRad(x)
  x * pi / 180
end

def sinR(x)
  Math.sin(x)
end

def sinD(x)
  Math.sin(degToRad(x))
end

def cosR(x)
  Math.cos(x)
end

def cosD(x)
  Math.cos(degToRad(x))
end

def tanR(x)
  Math.tan(x)
end

def tanD(x)
  Math.tan(degToRad(x))
end

# Conversions

def strToInt(s)
  s.to_i
end
