import std/sequtils

proc pascal*(n: int): seq[seq[int]] =
  if n == 0:
    return
  var triangle = @[@[1]]
  for i in 1..<n:
    triangle.add(@[])
    let base = @[0] & triangle[i-1] & @[0]
    for (l, r) in base.zip(base[1..^1]):
      triangle[i].add(l + r)
  triangle
