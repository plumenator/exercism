import std/math

proc score*(x, y: float): int =
  let distance = sqrt(x ^ 2 + y ^ 2)

  if distance <= 1:
    10
  elif distance <= 5:
    5
  elif distance <= 10:
    1
  else:
    0
