import std/[math, random, strformat]

proc privateKey*(p: int): int =
  rand(p - 3) + 2

proc publicKey*(p, g, a: int): int =
  (g ^ a) mod p

proc secret*(p, bPub, a: int): int =
  (bPub ^ a) mod p
