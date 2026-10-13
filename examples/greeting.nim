import std/macros
macro importAbsolutePath(path: static[string]): untyped =
  result = newTree(nnkImportStmt, newLit(path))
{.passL: "/home/k/Projects/Active/Nim/Min/src/std/io.a".}
proc rsSay(s: cstring) {.cdecl, importc.}
proc rsArgCount(): csize_t {.importc.}
proc rsArg(index: csize_t): cstring {.importc.}

{.passL: "/home/k/Projects/Active/Nim/Min/src/std/string.a".}
proc rsStrLen(s: cstring): csize_t {.importc.}
proc rsStrEq(a: cstring, b: cstring): bool {.importc.}
proc rsStrDup(s: cstring): cstring {.importc.}
proc rsStrFree(s: cstring) {.importc.}
proc rsStrConcat(a: cstring, b: cstring): cstring {.importc.}
proc rsi32ToStr(value: int32): cstring {.importc.}

{.passL: "/home/k/Projects/Active/Nim/Min/src/std/math/target/release/libmath.a".}
proc intAdd(a: int32, b: int32): int32 {.importc.}
proc intSub(a: int32, b: int32): int32 {.importc.}
proc intDiv(a: int32, b: int32): int32 {.importc.}
proc intMult(a: int32, b: int32): int32 {.importc.}
{.passL: "/home/k/Projects/Active/Nim/Min/src/std/math.a".}
proc rsAdd(a: int32, b: int32): int32 {.importc.}
proc rsSub(a: int32, b: int32): int32 {.importc.}
proc rsMult(a: int32, b: int32): int32 {.importc.}
proc rsIntDiv(a: int32, b: int32): int32 {.importc.}
proc rsStrToi32(s: cstring): int32 {.importc.}


var name = rsStrToi32(rsArg(1))
name = intAdd(name,5)
var greeting = rsStrConcat(rsStrConcat(cstring("\nHello "),rsi32ToStr(name)),cstring("\n"))

rsSay(greeting)
