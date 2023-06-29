import std/[sequtils, sugar, math]

proc distance*(a, b: string): int =
  if a.len != b.len:
    raise newException(ValueError, "different lens")
  var differences = collect:
    for (ai, bi) in zip(a, b):
      if ai == bi:
        0
      else:
        1
  differences.sum
