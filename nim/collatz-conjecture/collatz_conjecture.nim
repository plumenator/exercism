proc steps*(n: int): int =
  if n <= 0:
    raise newException(ValueError, "non positive parameter")
  var n = n
  while n > 1:
    result += 1
    if n mod 2 == 0:
      n = n div 2
    else:
      n = 3 * n + 1
