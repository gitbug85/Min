import math
import argparse

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

# Print
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="A math and conversion CLI utility script.")
    subparsers = parser.add_subparsers(dest="command", required=True, help="Available math commands")

    two_arg_commands = ["intAdd", "intSub", "intMult", "intDiv", "intMod", "intPow"]
    for cmd in two_arg_commands:
        cmd_parser = subparsers.add_parser(cmd)
        cmd_parser.add_argument("a", type=int, help="First number")
        cmd_parser.add_argument("b", type=int, help="Second number")

    one_num_commands = ["intAbs", "intSqrtFloor", "radToDeg", "degToRad", "sinR", "sinD", "cosR", "cosD", "tanR", "tanD"]
    for cmd in one_num_commands:
        cmd_parser = subparsers.add_parser(cmd)
        cmd_parser.add_argument("x", type=int, help="Input number")

    subparsers.add_parser("pi", help="Returns the value of Pi")

    str_parser = subparsers.add_parser("strToInt", help="Convert string representation to integer")
    str_parser.add_argument("s", type=str, help="The string to convert")

    args = parser.parse_args()

    try:
        if args.command in two_arg_commands:
            func_map = {
                "intAdd": intAdd, "intSub": intSub, "intMult": intMult,
                "intDiv": intDiv, "intMod": intMod, "intPow": intPow
            }
            print(func_map[args.command](args.a, args.b))

        elif args.command in one_num_commands:
            func_map = {
                "intAbs": intAbs, "intSqrtFloor": intSqrtFloor, "radToDeg": radToDeg,
                "degToRad": degToRad, "sinR": sinR, "sinD": sinD,
                "cosR": cosR, "cosD": cosD, "tanR": tanR, "tanD": tanD
            }
            print(func_map[args.command](args.x))

        elif args.command == "pi":
            print(pi())

        elif args.command == "strToInt":
            print(strToInt(args.s))

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)