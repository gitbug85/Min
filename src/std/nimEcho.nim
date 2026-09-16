
proc nimEcho*(s: cstring) {.exportc, cdecl.} =
    stdout.write s
    stdout.flushFile() 
