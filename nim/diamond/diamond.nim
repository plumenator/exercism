import std/unicode

proc spaces(s: var string, l: int) =
    for _ in 1..l:
      s.add(' ')
  
proc diamond*(c: char): string =
  if c < 'A' or c > 'Z':
    raise newException(ValueError, "illegal char")

  let width = 2*(ord(c) - ord('A')) + 1
  for d in 'A'..c:
    let outer = ord(c) - ord(d)
    result.spaces(outer)
    result.add(d)
    if d > 'A':
      let inner = width - 2 * outer - 2
      result.spaces(inner)
      result.add(d)
    result.spaces(outer)
    result.add('\n')
  if c > 'A':
    result &= result.reversed[2+width..^1]
    result.add('\n')
