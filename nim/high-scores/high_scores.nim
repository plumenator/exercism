import std/[math, algorithm, sequtils]

proc latest*(scores: openArray[int]): int =
  scores[^1]

proc personalBest*(scores: openArray[int]): int =
  scores.max

proc personalTopThree*(scores: openArray[int]): seq[int] =
  let s = scores.sorted(Descending)
  if s.len < 3:
    s
  else:
    s[s.low..s.low+2]
