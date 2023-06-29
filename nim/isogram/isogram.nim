import std/[sets, sequtils, strutils]

proc isIsogram*(s: string): bool =
  let alphas = s.toLowerAscii.filterIt(it.isAlphaAscii)
  alphas.len == alphas.toHashSet.card
