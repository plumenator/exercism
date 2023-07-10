import std/[sequtils, sets]

proc primes*(limit: int): seq[int] =
  var sieve = (2..limit).toSeq.toOrderedSet
  while sieve.len > 0:
    var prime: int
    for i in sieve:
      prime = i
      break
    result.add prime
    for i in 1..(limit div prime):
      sieve.excl prime * i
      
