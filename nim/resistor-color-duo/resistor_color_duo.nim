type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc value*(colors: openArray[ResistorColor]): int =
  10 * colors[0].ord + colors[1].ord
