import std/sequtils

proc slices*(s: string, n: int): seq[string] =
  if n < 1 or n > s.len:
    raise newException(ValueError, "")
  result = newSeq[string](s.len - n + 1)
  for i in 0..<n:
    result = result.zip(s[i..^1]).mapIt(it[0] & $it[1])
    
