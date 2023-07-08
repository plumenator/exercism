type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc colorCode*(color: ResistorColor): int =
  ord(color)

proc colors*: array[0..ResistorColor.high.ord, ResistorColor] =
  [Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White]
