import std/[math, tables]

let numeral = {
  1000: "M",
  2000: "MM",
  3000: "MMM",
  900: "CM",
  800: "DCCC",
  700: "DCC",
  600: "DC",
  500: "D",
  400: "CD",
  300: "CCC",
  200: "CC",
  100: "C",
  90: "XC",
  80: "LXXX",
  70: "LXX",
  60: "LX",
  50: "L",
  40: "XL",
  30: "XXX",
  20: "XX",
  10: "X",
  9: "IX",
  8: "VIII",
  7: "VII",
  6: "VI",
  5: "V",
  4: "IV",
  3: "III",
  2: "II",
  1: "I",
}.toTable

proc roman*(n: int): string =
  if n notin 1..3999:
    raise newException(ValueError, "")

  var num = n
  for i in countdown(3, 0):
    let place = num - (num mod (10 ^ i))
    if place > 0:
      result &= numeral[place]
    num = num - place
