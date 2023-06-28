import std/sets

proc sum*(limit: int, factors: openArray[int]): int =
  var multiples: HashSet[int]
  for factor in factors:
    if factor == 0:
      break
    var max = limit.div(factor)
    if limit.mod(factor) == 0:
      max -= 1
    for i in 1..max:
      multiples.incl(factor * i)
  var total = 0
  for multiple in multiples:
    total += multiple
  total
