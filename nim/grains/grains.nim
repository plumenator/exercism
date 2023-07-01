import std/[sequtils, math]

proc onSquare*(n: int): uint64 =
  if n < 1 or n > 64:
    raise newException(ValueError, "non positive param")
  (result + 2) ^ (n - 1)

proc total*: uint64 =
  # toSeq(1..64).foldl(a + onSquare(b))
  for n in 1..64:
    result += onSquare(n)