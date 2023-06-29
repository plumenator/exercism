import std/[strutils, sequtils]

proc abbreviate*(s: string): string =
  s.split(Whitespace + {'-', '_'})
  .filterIt(not it.isEmptyOrWhitespace)
  .mapIt(it[0].toUpperAscii)
  .join
