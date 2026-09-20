import codegen
import tokens

type
  Node = ref object of RootObj
    name*: string

  Identifier = ref object of Node
    keyword: string
    value: string

  Assignment = ref object of Node
    identifier: Identifier
    value: Node

  File* = ref object of Node
    body*: seq[Node]

  String = ref object of Node
    value: string

  Integer = ref object of Node
    bits: string
    value: string

  Call = ref object of Node
    identifier: string
    parameters: seq[Identifier]

  If = ref object of Node
    condition: Node
    body: seq[Node]

  BinaryOperation = ref object of Node
    operator: string
    lOperand: Node
    rOperand: Node

  UnaryOperation = ref object of Node
    operator: string
    operand: Node

  Parser* = ref object
    toks: seq[Token]
    pos: int

  # Util, use or import
  Outside* = ref object of Node
    outside: string
    identifier: string

proc newNode(name: string): Node =
  Node(name: name)

proc newIdentifier(name: string, keyword: string, value: string): Identifier =
  Identifier(
    name: "REFERENCE",
    keyword: keyword,
    value: value
  )

proc newAssignment(identifier: Identifier, value: Node): Assignment =
  Assignment(
    name: "ASSIGNMENT",
    identifier: identifier,
    value: value
  )

proc newFile(body: seq[Node]): File =
  File(
    name: "FILE",
    body: body
  )

proc newString(value: string): String =
  String(
    name: "STRING",
    value: value
  )

proc newInteger(bits: string, value: string): Integer =
  Integer(
    name: "INTEGER",
    bits: bits,
    value: value
  )

proc newCall(identifier: string, parameters: seq[Identifier]): Call =
  Call(
    name: "CALL",
    identifier: identifier,
    parameters: parameters
  )

proc newIf(condition: Node, body: seq[Node]): If =
  If(
    name: "IF",
    condition: condition,
    body: body
  )

proc newBinaryOperation(
  operator: string,
  lOperand: Node,
  rOperand: Node
): BinaryOperation =
  BinaryOperation(
    name: "BINARY_OPERATION",
    operator: operator,
    lOperand: lOperand,
    rOperand: rOperand
  )

proc newUnaryOperation(
  operator: string,
  operand: Node
): UnaryOperation =
  UnaryOperation(
    name: "UNARY_OPERATION",
    operator: operator,
    operand: operand
  )

proc newOutside(outside: string, identifier: string): Outside =
  Outside(outside: outside, identifier: identifier)

proc newParser*(toks: seq[Token]): Parser =
  Parser(
    toks: toks,
    pos: 0
  )

proc current(self: Parser): Token =
  self.toks[self.pos]

proc next(self: Parser): Token =
  self.toks[self.pos + 1]

proc expect(self: Parser, kind: string): Token =
  let nextToken = self.toks[self.pos + 1]

  if nextToken.kind == kind:
    self.pos+=1
    return nextToken

  raise newException(ValueError,
    "Expected '" & kind & "', got '" & nextToken.kind & "'"
  )

proc parseAssignment(self: Parser): Node =
  raise newException(ValueError, "parseAssignment not implemented")

proc parseStatement(self: Parser): Node =
  var cur = self.current()

  case cur.kind
  of "MUTABLE":
    raise newException(ValueError, "MUTABLE parsing not implemented")
  of "FLEX":
    raise newException(ValueError, "FLEX parsing not implemented")
  of "MUTFLEX":
    raise newException(ValueError, "MUTFLEX parsing not implemented")
  of "IDENTIFIER":
    raise newException(ValueError, "IDENTIFIER parsing not implemented")
  of "UTILITY":
    var next = self.expect("IDENT")
    return newOutside("util", next.value)
  of "USE":
    var next = self.expect("IDENT")
    return newOutside("use", next.value)
  of "IMPORT":
    var next = self.expect("IDENT")
    return newOutside("imp", next.value)

  else:
    raise newException(
      ValueError,
      "Unexpected token: " & cur.kind
    )

proc skipNewlines(self: Parser): int =
  var skipping = true
  var indents = 0
  while skipping:
    var cur = self.current()
    if cur.kind == "NEWLINE":
      self.pos+=1
    elif cur.kind == "TAB":
      indents+=1
      self.pos+=1
    else:
      skipping = false

proc parseFile(self: Parser): File =
  var body: seq[Node] = @[]

  while true:
    body.add(self.parseStatement())
    let nextToken = self.next()

    if nextToken.kind == "EOF":
      break
    var indents = self.skipNewlines()

  result = newFile(body)

proc genAst*(self: Parser): File =
  result = self.parseFile()