import std/[math, strutils, sequtils, sugar]

proc isValid*(s: string): bool =
  let s = s.filter(isAlphaNumeric)
  s.len == 10 and
  s[0..^2].all(isDigit) and
  (s[^1].isDigit or s[^1].toUpperAscii == 'X') and
  (s.mapIt(if it.isDigit: ord(it) - ord('0') else: 10)
    .zip(countdown(10, 1).toSeq)
    .mapIt(it[0] * it[1])
    .sum mod 11 == 0)
