import std/[algorithm, strutils, sequtils, math]

proc isValid*(s: string): bool =
  let s = s.replace(" ").toSeq
  if s.len < 2:
    return false
  if s.anyIt(not isDigit(it)):
    return false
  s
  .reversed
  .zip(@[1, 2].cycle(s.len div 2 + 1))
  .map(
    func(t: (char, int)): int =
      let (c, i) = t
      let d = ord(c) - ord('0')
      let s = i * d
      if s > 9:
        s - 9
      else:
        s
  )
  .sum mod 10 == 0
