proc toRna*(s: string): string =
  for c in s:
    result. add case c
                of 'G': 'C'
                of 'C': 'G'
                of 'T': 'A'
                of 'A': 'U'
                else: raise newException(ValueError, "")
