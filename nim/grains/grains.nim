import std/[sequtils, math]

proc onSquare*(n: int): uint64 =
  if n < 1 or n > 64:
    raise newException(ValueError, "non positive param")
  2u64 ^ (n - 1)

proc total*: uint64 =
  toSeq(1..64).foldl(a + onSquare(b), 0u64)
