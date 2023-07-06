import std/[tables, sequtils]

proc countDna*(s: string): CountTable[char] =
  let s = s.items.toSeq
  if s.anyIt(it notin "ACGT"):
    raise newException(ValueError, "invalid char")
  s.toCountTable
