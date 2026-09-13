import tokens
import ast

proc lower*(tokens: seq[Token]): string =
    var parser = Parser()
    var file = genAst(parser, tokens)

    for node in file.body:
        echo node.name

    return ""