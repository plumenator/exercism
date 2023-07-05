import std/[strutils, sequtils, math]

proc isValid*(s: string): bool =
  if s.len == 0 or not s[0].isDigit:
    return false

  var digits: seq[int]

  var index = 0
  for c in s[0..^2]:
    if c.isDigit:
      echo index
      digits.add (10 - index) * (ord(c) - ord('0'))
      index.inc
    elif c == '-':
      continue
    else:
      return false

  if s[^1].isDigit:
    digits.add ord(s[^1]) - ord('0')
  elif s[^1].toUpperAscii == 'X':
    digits.add 10
  else:
    return false

  digits.len == 10 and digits.sum mod 11 == 0
