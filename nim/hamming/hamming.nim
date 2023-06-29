import std/sequtils

proc distance*(a, b: string): int =
  if a.len != b.len:
    raise newException(ValueError, "different lens")
  zip(a, b).foldl(a + (if b[0] == b[1]: 0 else: 1), 0)
