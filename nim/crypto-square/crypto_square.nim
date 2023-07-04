import std/[strutils, sequtils, math]

proc encrypt*(s: string): string =
  let normalized = s.toLower.filter(isAlphaNumeric)

  if normalized.len == 0:
    return

  let
    c = normalized.len.toFloat.sqrt.ceil.toInt
    r = normalized.len.ceilDiv(c)

  for j in 0..<c:
    for i in 0..<r:
      let index = i*c + j
      if index <= normalized.high:
        result.add(normalized[index])
      else:
        result.add(' ')
    if j < c - 1:
      result.add(' ')
