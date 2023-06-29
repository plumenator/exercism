import std/math

proc squareOfSum*(n: int): int =
  let s = n * (n + 1) div 2
  s * s

proc sumOfSquares*(n: int): int =
  for i in 1..n:
    result += i * i

proc difference*(n: int): int =
  n.squareOfSum - n.sumOfSquares
