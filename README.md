# Min

Programming language which transpiles to Nim. I'm making it with the goal of simplifying operators.

### Install
Download the latest release. Put the folder where you want it. Then run ```install.sh```.\
You now should be able to transpile .min files with the command ```min t ./file.min```

### Example
```
# Get standard libraries
util math
util string
util io
util rsPath

# Get Nim module
use multiply

# Get arguments
l_operand = strToi32(arg(1))
operator = arg(2)
r_operand = strToi32(arg(3))

# Print
if strEq(operator, "+"):
    say i32ToStr(add(l_operand, r_operand))
if strEq(operator, "-"):
    say i32ToStr(sub(l_operand, r_operand))
if strEq(operator, "x"):
    say i32ToStr(mult(l_operand, r_operand))

```
