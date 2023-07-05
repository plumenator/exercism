import std/[strutils, sequtils]

type
  Plant* = enum
    Clover, Grass, Radishes, Violets

proc plants*(garden: string, student: string): seq[Plant] =
  let s = student[0].toUpperAscii.ord - 'A'.ord
  let upper = garden.toUpperAscii
  (upper[2*s..2*s + 1] & upper[2*s + upper.len/%2 + 1..2*s + upper.len/%2 + 2])
  .mapIt(case it
         of 'C': Clover
         of 'G': Grass
         of 'R': Radishes
         of 'V': Violets
         else: raise newException(ValueError, "invalid plant"))
