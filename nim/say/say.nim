import std/[tables, sequtils, algorithm, strutils]

let words = {
  0i64: "zero",
  1i64: "one",
  2i64: "two",
  3i64: "three",
  4i64: "four",
  5i64: "five",
  6i64: "six",
  7i64: "seven",
  8i64: "eight",
  9i64: "nine",
  10i64: "ten",
  11i64: "eleven",
  12i64: "twelve",
  13i64: "thirteen",
  14i64: "fourteen",
  15i64: "fifteen",
  16i64: "sixteen",
  17i64: "seventeen",
  18i64: "eighteen",
  19i64: "nineteen",
  20i64: "twenty",
  30i64: "thirty",
  40i64: "forty",
  50i64: "fifty",
  60i64: "sixty",
  70i64: "seventy",
  80i64: "eighty",
  90i64: "ninety",
}.toTable

proc say*(n: int64): string =
  if n notin 0..999999999999:
    raise newException(ValueError, "")
  case n
  of 0..20:
    words[n]
  of 21..99:
    let rem = n mod 10
    let ten = n - rem
    words[ten] & (if rem > 0 : "-" & words[rem] else: "")
  of 100..999:
    let rem = n mod 100
    let hundred = n div 100
    words[hundred] & " hundred" & (if rem > 0 : " " & say(rem) else: "")
  else:
    var thousands: seq[int64]
    var num = n
    while num > 0:
      thousands.add num mod 1000
      num = num div 1000
    thousands
    .zip(@["", "thousand", "million", "billion", "trillion"])
    .reversed
    .filterIt(it[0] > 0)
    .mapIt(say(it[0]) & " " & it[1])
    .join(" ")
    .strip
