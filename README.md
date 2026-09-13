# Min

Programming language which transpiles to Nim. I'm making it with the goal of simplifying operators.

### Install
Download the latest release. Put the folder where you want it. Then run ```install.sh```.\
You now should be able to compile .minop files with the command ```min c ./file.min```

### Example
```
# Importing standard libraries
use math
use string
use io
use rustPath

# Import Nim module
imp multiply

# Get arguments
left_operand = rs_str_to_i32(arg(1))
operator = arg(2)
right_operand = rs_str_to_i32(arg(3))

# Calculate and print
if rs_str_eq(operator, "+"):
    say rs_i32_to_str(rs_add(left_operand, right_operand))
if rs_str_eq(operator, "-"):
    say rs_i32_to_str(rs_sub(left_operand, right_operand))
if rs_str_eq(operator, "x"):
    say rs_i32_to_str(nim_mult(left_operand, right_operand))
```
