type
  Classification* = enum
    Perfect, Deficient, Abundant

proc classify*(n: int): Classification =
  if n < 1:
    raise newException(ValueError, "not positive")
  var sum = 0
  for f in 1..<n:
    if n mod f == 0:
      sum += f
  if sum < n:
    Deficient
  elif sum == n:
    Perfect
  else:
    Abundant
