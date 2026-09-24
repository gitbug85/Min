import tokens
import ast
import std/syncio

proc lower*(tokens: seq[Token], target: string): string =
    flushFile(stdout)
    var parser = newParser(tokens)
    var file = genAst(parser)

    var names = "\n"
    for node in file.body:
        names &= node.name & "\n"

    return names