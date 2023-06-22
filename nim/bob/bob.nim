import std/strutils
import std/sequtils

proc hey*(s: string): string =
  if isEmptyOrWhitespace(s):
    return "Fine. Be that way!"

  var is_question = s.strip().endswith("?")
  var letters = filter(s, isAlphaAscii)
  var is_yelling = len(letters) != 0 and len(filter(letters, isLowerAscii)) == 0

  if is_question and is_yelling:
    "Calm down, I know what I'm doing!"
  elif is_question:
    "Sure."
  elif is_yelling:
    "Whoa, chill out!"
  else:
    "Whatever."
    
    
