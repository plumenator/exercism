import std/[sequtils, strutils, math]

func encodeChar(c: char): char =
    chr('z'.ord - c.ord + 'a'.ord)

func encodeWord(s: seq[char]): string =
  cast[string](s.mapIt(if it.isAlphaAscii: encodeChar(it) else: it))

proc encode*(s: string): string =
  let filtered = s.toLowerAscii.filter(isAlphaNumeric)
  filtered.distribute(ceilDiv(filtered.len, 5), false).map(encodeWord).join(" ")

proc decode*(s: string): string =
  encode(s).replace(" ")
