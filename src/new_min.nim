{.passL: "/home/k/Projects/Active/Nim/Min/src/std/io.a".}
proc say(s: cstring) {.cdecl, importc.}
proc arg_count(): csize_t {.importc.}
proc arg(index: csize_t): cstring {.importc.}

{.passL: "/home/k/Projects/Active/Nim/Min/src/std/string.a".}
proc rs_str_len(s: cstring): csize_t {.importc.}
proc rs_str_eq(a: cstring, b: cstring): bool {.importc.}
proc rs_str_dup(s: cstring): cstring {.importc.}
proc rs_str_free(s: cstring) {.importc.}
proc rs_str_concat(a: cstring, b: cstring): cstring {.importc.}
proc rs_i32_to_str(value: int32): cstring {.importc.}

{.passL: "/home/k/Projects/Active/Nim/Min/src/std/libnimEcho.a".}
proc nimEcho(s: cstring) {.cdecl, importc.}


let first = arg(1)
let second = arg(2)

if rs_str_eq(first,cstring("t")):
  nimEcho(cstring("test"))
