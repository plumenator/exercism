import std/[strutils, tables, sequtils]

proc countWords*(s: string): Table[string, int] =
  var table = s.toLowerAscii
  .split(Whitespace + {':', '!', ',', '?', ';', '.', '"', '&', '@', '$', '%', '^', '&'})
  .mapIt(it.strip(chars={'\''}))
  .filterIt(not it.isEmptyOrWhitespace)
  .toCountTable
  for key, val in mpairs(table):
    result[key] = val
