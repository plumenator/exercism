proc spiral*(n: static int): array[n, array[n, int]] =
  var
    r = 0
    c = 0
    l = 0
    h = n - 1
    rd = 0
    cd = 1
    
  for i in 1..n*n:
    result[r][c] = i
    if c == h and r == h:
      cd = -1
      rd = 0
    elif c == l and r == h:
      rd = -1
      cd = 0
    elif c == l and r == h:
      cd = 1
      rd = 0
    elif c == h and r == l:
      rd = 1
      cd = 0
    elif c == l and r == l + 1:
      l.inc
      h.dec
      rd = 0
      cd = 1
    r += rd
    c += cd
      
         
