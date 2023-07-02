import std/options

func binarySearchInternal(haystack: openArray[int], needle: int, first, last: int): Option[int] =
  if first > last:
    return none(int)
  if first == last:
    if needle == haystack[first]:
      return some(first)
    else:
      return none(int)
  let mid = (first + last) /% 2
  let left = haystack.binarySearchInternal(needle, mid + 1, last)
  let right = haystack.binarySearchInternal(needle, first, mid)
  if left.is_some:
    left
  else:
    right

proc binarySearch*(a: openArray[int], val: int): int =
  a.binarySearchInternal(val, 0, a.len - 1).get(-1)
