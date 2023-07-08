import std/[sequtils, math, tables]

let table = {
  "AUG": "Methionine",
  "UGG": "Tryptophan",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UAU": "Tyrosine",
  "UAC": "Tyrosine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine"
  }.toTable

proc translate*(s: string): seq[string] =
  if s.len == 0:
    return
  for codon in s.toSeq.distribute(ceilDiv(s.len, 3), false):
    let codon = cast[string](codon)
    if codon notin @["UAA", "UAG", "UGA"]:
      result.add table[codon]
    else:
      break
