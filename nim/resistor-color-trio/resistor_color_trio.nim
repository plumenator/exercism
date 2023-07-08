import std/math

type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc label*(r: array[3, ResistorColor]): tuple[value: int, unit: string] =
  var value = (10 * r[0].ord + r[1].ord) * 10 ^ r[2].ord
  var units = "ohms"
  if value > 999999999:
    value = value div 10 ^ 9
    units = "giga" & units
  elif value > 999999:
    value = value div 10 ^ 6
    units = "mega" & units
  elif value > 999:
    value = value div 10 ^ 3
    units = "kilo" & units
  (value, units)
