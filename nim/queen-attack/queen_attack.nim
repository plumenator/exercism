type
  Queen* = object
    row*: int
    col*: int

proc initQueen*(row, col: int): Queen =
  if row notin 0..7 or col notin 0..7:
    raise newException(ValueError, "invalid")
  Queen(row: row, col: col)

proc canAttack*(white, black: Queen): bool =
  if white == black:
    raise newException(ValueError, "invalid")
  white.row == black.row or
  white.col == black.col or
  abs((white.row - black.row) / (white.col - black.col)) == 1
     

proc board*(white, black: Queen): string =
  if white == black:
    raise newException(ValueError, "invalid")
  for row in 0..7:
    for col in 0..7:
      if (row, col) == (white.row, white.col):
        result.add 'W'
      elif (row, col) == (black.row, black.col):
        result.add 'B'
      else:
        result.add '_'
    result.add '\n'
