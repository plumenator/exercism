import std/[sugar, strutils]
proc clean*(s: string): string =
  let digits = collect:
    for c in s:
      if c.isDigit:
        c
  if digits.len < 10:
    raise newException(ValueError, "too short")
  elif digits.len > 10:
    if digits.len == 11:
      if digits[0] != '1':
        raise newException(ValueError, "country code not 1")
    else:
      raise newException(ValueError, "too long")
  let start = if digits.len == 10: 0 else: 1
  if digits[start].ord < ord('2') or digits[start + 3].ord < ord('2'):
    raise newException(ValueError, "invalid")
  for d in digits[start..^1]:
    result.add(d)
