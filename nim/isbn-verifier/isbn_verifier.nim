import std/[strutils, sequtils]

proc isValid*(s: string): bool =
  let s = s.filter(isAlphaNumeric)

  if s.len != 10:
    return false

  var sum = 0

  for i, c in s[0..^2]:
    if c.isDigit:
      sum += (10 - i) * (ord(c) - ord('0'))
    else:
      return false

  if s[^1].toUpperAscii == 'X':
    sum += 10
  elif s[^1].isDigit:
    sum += ord(s[^1]) - ord('0')
  else:
    return false

  sum mod 11 == 0
