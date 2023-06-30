import std/[sugar, math]

proc isArmstrongNumber*(n: int): bool =
  let s = $n
  let powers = collect:
    for digit in s:
      (int(digit) - int('0')) ^ s.len
  powers.sum == n
