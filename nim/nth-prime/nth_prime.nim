proc prime*(n: int): int =
  if n < 1:
    raise newException(ValueError, "invalid prime")
  var count = 0
  var num = 2
  while count < n:
    var prime = true
    for i in 2..<num:
      if num mod i == 0:
        prime = false
        break
    if prime:
      count.inc
    num.inc
  return num - 1
  
  
    
