import std/[strformat, strutils]

proc encode*(s: string): string =
  var prev = '\0'
  var count = 0
  for c in s:
    if prev == c:
      count.inc
    else:
      if count > 1:
        result &= fmt"{count}{prev}"
      elif count == 1:
        result.add prev
      count = 1
      prev = c
  if count > 1:
    result &= fmt"{count}{prev}"
  elif count == 1:
    result.add prev

proc decode*(s: string): string =
  var count = ""
  for c in s:
    if c in '0'..'9':
      count.add c
    else:
      if count.len == 0:
        result.add c
      else:
        for _ in 1..parseInt(count):
          result.add c
          count = ""
