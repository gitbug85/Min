import tables

let processes* = {
    # io.rs
    "say": "rsSay",
    "argCount": "rsArgCount",
    "arg": "rsArg",
    # math.rs
    "add": "rsAdd",
    "sub": "rsSub",
    "mult": "rsMult",
    "intDiv": "rsIntDiv",
    "strToi32": "rsStrToi32",
    # nimEcho.nim
    "echo": "nimEcho",
    # nimPath.nim
    "join": "nimJoinPath",
    "parentDir": "nimParentDir",
    "basename": "nimBasename",
    "stem": "nimStem",
    "ext": "nimExt",
    # rsPath.rs
    "isFile": "rsIsFile",
    "isDir": "rsIsDir",
    "hasExtOf": "rsHasExtOf",
    # string.rs
    "strLen": "rsStrLen",
    "strEq": "rsStrEq",
    "strDup": "rsStrDup",
    "strFree": "rsStrFree",
    "strConcat": "rsStrConcat",
    "i32ToStr": "rsi32ToStr",
    "colorRed": "crColorRed",
    "colorGreen": "crColorGreen",
    "colorBlue": "crColorBlue",
    "colorReset": "crColorReset"
    }.toTable
