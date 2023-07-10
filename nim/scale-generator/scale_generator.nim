import std/strutils

let sharpScale = @[
  "A", "A#",
  "B",
  "C", "C#",
  "D", "D#",
  "E",
  "F", "F#",
  "G", "G#"
]

let flatScale = @[
  "A", "Bb",
  "B",
  "C", "Db",
  "D", "Eb",
  "E",
  "F", "Gb",
  "G", "Ab"
]

let sharp = @[
  "C", "a", "G", "D", "A", "E", "F#", "B", "e", "b", "f#", "c#", "g#", "d#"
]

proc chromaticScale(tonic: string): seq[string] =
  var chromatics: seq[string]
  if tonic in sharp:
    chromatics = sharpScale
  else:
    chromatics = flatScale
  var start = 0
  var upper = tonic
  upper[0] = upper[0].toUpperAscii
  for i, t in chromatics:
    if t == upper:
      start = i
  for i in 0..<12:
    result.add chromatics[(start + i) mod 12]

proc scale*(tonic: string, intervals: string): seq[string] =
  let chromatics = chromaticScale(tonic)
  result.add chromatics[0]
  var i = 1
  for c in intervals:
    if c == 'M':
      result.add chromatics[(i + 1) mod 12]
      i.inc 2
    elif c == 'A':
      result.add chromatics[(i + 2) mod 12]
      i.inc 3
    else:
      result.add chromatics[i mod 12]
      i.inc
