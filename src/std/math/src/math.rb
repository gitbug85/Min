
# Basic arithmetic


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
