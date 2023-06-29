import std/[algorithm, sequtils, strutils]

func isAnagram(a, b: string): bool =
  var la = a.toLowerAscii
  var lb = b.toLowerAscii
  la != lb and la.sorted == lb.sorted
  
proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string] =
  candidates.filterIt(it.isAnagram(word))
