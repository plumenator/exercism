import std/[sequtils, algorithm, math]

proc convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase < 2 or toBase < 2:
    raise newException(ValueError, "illegal base")

  if digits.anyIt(it < 0 or it >= fromBase):
    raise newException(ValueError, "invalid digit")

  var num = digits
  .reversed
  .zip(toSeq(0..<digits.len))
  .mapIt(it[0] * (fromBase ^ it[1]))
  .sum
  
  if num == 0:
    return @[0]

  while num > 0:
    let digit = num mod toBase
    result.add(digit)
    num = num div toBase

  result.reverse
