import std/[sets, strutils, sequtils]

proc isPangram*(s: string): bool =
  s.toLowerAscii.filterIt(it.isAlphaAscii).toHashSet.card == 26
