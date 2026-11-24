
type
  PosTok* = object
    val*: string
    col*: int
    ln*: int
    canTouch*: bool

func splitByLines(content: string): seq[PosTok] =
  var lineNum = 0

  for line in content.splitLines():
    result.add(PosTok(val: line, col: 0, ln: lineNum, canTouch: true))
    inc lineNum

proc splitBySpacing(posTokSeq: seq[PosTok]) =


func lex(content: string): seq[PosTok] =
  # Split by lines
  var posTokSeq = splitByLines(content)
  # Split by spacing
  var
