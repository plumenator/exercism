import std/[sequtils, strformat, strutils]

func line(word, word2: string): string =
  fmt"For want of a {word} the {word2} was lost."
  
proc recite*(words: openArray[string]): string =
  if words.len == 0:
    return
  let lines = words
  .zip(words[1..^1])
  .mapIt(line(it[0], it[1])) &
    @[fmt"And all for the want of a {words[0]}."]
  lines.join("\n")

