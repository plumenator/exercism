import std/[math, sets, sequtils]

proc sum*(limit: int, factors: openArray[int]): int =
  var multiples: HashSet[int]
  multiples.incl(0)
  for factor in factors.filterIt(it != 0):
    var max = limit.div(factor)
    if limit.mod(factor) == 0:
      max -= 1
    for i in 1..max:
      multiples.incl(factor * i)
  multiples.items.toSeq.sum
