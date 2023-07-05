import std/[math, strutils, sequtils, sugar, strformat]

proc largestProduct*(s: string, span: int): int =
  if span < 0 or span > s.len:
    raise newException(ValueError, "invalid span")

  let s = toSeq(s).mapIt(parseInt(fmt"{it}"))

  toSeq(0..s.len-span)
  .mapIt(s[it..it+span-1].prod)
  .max
