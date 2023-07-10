import std/[bitops, algorithm]

proc commands*(n: int): seq[string] =
  if n.bitsliced(0..0) == 1:
    result.add "wink"
  if n.bitsliced(1..1) == 1:
    result.add "double blink"
  if n.bitsliced(2..2) == 1:
    result.add "close your eyes"
  if n.bitsliced(3..3) == 1:
    result.add "jump"
  if n.bitsliced(4..4) == 1:
    result.reverse
