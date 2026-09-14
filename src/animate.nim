import std/os

const
  stages = ["○", "◔", "◑", "◕", "●"]

  Reset = "\e[0m"
  Green = "\e[32m"
  Red   = "\e[31m"

type
  Printer = object
    stage: int

proc animate*(ok: bool, durationMs: int) =
  var printer = Printer(stage: 0)

  let delayMs = max(1, durationMs div (stages.len - 1))

  # Animation
  while printer.stage < stages.high:
    stdout.write("\r" & stages[printer.stage])
    stdout.flushFile()

    sleep(delayMs)
    inc printer.stage

  # Final result
  let statusColor = if ok: Green else: Red
  let status = if ok: "OK" else: "ER"
  let message = if ok:
      "Transpilation succeeded"
    else:
      "Transpilation failed"

  stdout.write(
    "\r" & statusColor & "● [" & status & "]: " & Reset & message & "\n"
  )
