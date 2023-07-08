proc rotate*(s: string, n: int): string =
  let a = ord('a')
  let aa = ord('A')
  for c in s:
    result.add if c in 'a'..'z':
                 chr(a + (c.ord - a + n) mod 26)
              elif c in 'A'..'Z':
                chr(aa + (c.ord - aa + n) mod 26)
              else:
                 c
