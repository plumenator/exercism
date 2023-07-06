import std/[algorithm, strutils, sequtils, math]

proc isValid*(s: string): bool =
  let s = s.replace(" ").items.toSeq
  if s.len < 2:
    return false
  if s.anyIt(not isDigit(it)):
    return false
  s
  .reversed
  .zip(toSeq(1..s.len))
  .map(
    func(t: (char, int)): int =
      let (c, i) = t
      let d = ord(c) - ord('0')
      if i mod 2 == 0:
        let s = 2 * d
        if s > 9:
          s - 9
        else:
          s
      else:
        d
  )
  .sum mod 10 == 0
