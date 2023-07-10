type
  Comparison* = enum
    Unequal, Sublist, Superlist, Equal

proc isSub(a, b:openArray[int]): bool =
  if a.len >= b.len:
    return false
  if a.len == 0:
    return true
  var start = 0
  while start <= b.high:
    let offset = b[start..^1].find(a[0])
    if offset < 0:
      return false
    let sub0 = start + offset
    if sub0 + a.len > b.len:
      return false
    if b[sub0..sub0 + a.len - 1] == a:
      return true
    start = sub0 + 1
  return false

proc sublist*(a, b: openArray[int]): Comparison =
  if a == b:
    Equal
  elif isSub(a, b):
    Sublist
  elif isSub(b, a):
    Superlist
  else:
    Unequal
