import std/[tables, strutils]

proc transform*(t: Table[int, seq[char]]): Table[char, int] =
  for score, chars in t.pairs:
    for ch in chars:
      result[ch.toLowerAscii] = score
