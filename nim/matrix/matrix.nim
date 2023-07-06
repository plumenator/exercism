import std/[strutils, sequtils]

proc row*(s: string, n: int): seq[int] =
  s
  .splitLines[n - 1]
  .splitWhitespace
  .map(parseInt)

proc column*(s: string, n: int): seq[int] =
  s
  .splitLines
  .mapIt(it.splitWhitespace[n - 1].parseInt)
    
  
