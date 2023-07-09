import std/[sequtils, strformat]

proc saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  if matrix.len == 0:
    return
  let maxs = matrix.mapIt(it.max)
  let mins = matrix.foldl(
    a.zip(b)
    .map(
      proc(t: (seq[int], int)): seq[int] =
        t[0] & @[t[1]]
    ),
    @[int.high].repeat(matrix[0].len)
  )
  .mapIt(it.min)
  for r, mx in maxs:
    for c, mn in mins:
      if mx == mn:
        result.add (r + 1, c + 1)
