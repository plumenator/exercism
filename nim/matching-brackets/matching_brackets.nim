proc isPaired*(s: string): bool =
  var stack: seq[char]
  for c in s:
    if c in {'[', '(', '{'}:
      stack.add(c)
    elif stack.len == 0 and c in {']', ')', '}'}:
      return false
    elif stack.len != 0:
      let last = stack[^1]
      if (c == ']' and last == '[') or
         (c == ')' and last == '(') or
         (c == '}' and last == '{'):
        discard stack.pop
      elif (c == ']' and last != '[') or
           (c == ')' and last != '(') or
           (c == '}' and last != '{'):
        return false
  stack.len == 0
          
    
             
