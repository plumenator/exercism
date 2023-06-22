import std/strformat

proc twoFer*(name = ""): string =
  if name == "":
    "One for you, one for me."
  else:
    fmt"One for {name}, one for me."
