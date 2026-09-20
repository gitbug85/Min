
proc nimEcho*(s: cstring) =
    stdout.write s
    stdout.flushFile() 
