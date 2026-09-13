import std/parseopt
import tokens
import nim_gen
import std/strformat
import osproc
import lexer
import std/json
import os

var p = initOptParser()
let appDir = getAppDir()

var command = ""
var path = ""

while true:
  p.next()

  case p.kind
  of cmdEnd:
    break

  of cmdShortOption, cmdLongOption:
    discard

  of cmdArgument:
    if command == "":
      command = p.key
    elif command == "c" and path == "":
      path = p.key
    else:
      quit("Unexpected argument: " & p.key, 1)

if command == "c":
  if path == "":
    quit("Usage: myprogram c <path>", 1)

  if not fileExists(path):
    quit "File not found!"

  let fileInfo = splitFile(path)
  if not (fileInfo.ext == ".min"):
    quit "Incorrect file extension!"
  var lexemes: seq[Segment] = lex(path)
  var tokens: seq[Token] = tokenize(lexemes)
  var content = lower(tokens, "nim")
  let parent = parentDir(path)
  let (_, stem, _) = splitFile(path)
  let basename = stem & ".nim"
  let full_path = parent / basename
  writeFile(full_path, content)

else:
  quit("Unknown command: " & command, 1)
