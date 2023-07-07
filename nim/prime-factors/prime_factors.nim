iterator primes(): int =
  yield 2
  yield 3

  var num = 6
  while true:
    yield num - 1
    yield num + 1
    num += 6

proc primeFactors*(n: int64): seq[int] =
  var n = n
  for prime in primes():
    while n mod prime == 0:
      result.add(prime)
      n = n div prime
    if n == 1:
      break
    
