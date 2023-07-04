import std/math

proc score*(x, y: float): int =
  let distance = sqrt(x ^ 2 + y ^ 2)

  if distance <= 1:
    return 10
  elif distance <= 5:
    return 5
  elif distance <= 10:
    return 1
  else:
    return 0
