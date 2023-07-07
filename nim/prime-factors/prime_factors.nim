iterator primes(): int =
  var num = 2
  while true:
    var prime = true
    for i in 2..<num:
      if num mod i == 0:
        prime = false
        break
    if prime:
      yield num
    num.inc  
  
proc primeFactors*(n: int64): seq[int] =
  var n = n
  for prime in primes():
    while n mod prime == 0:
      result.add(prime)
      n = n div prime
    if n == 1:
      break
    
