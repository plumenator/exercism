import std/options

proc binarySearch*(a: openArray[int], val: int): int =
  var
    first = a.low
    last = a.high

  while first <= last:
    let mid = (first + last) div 2
    if a[mid] < val:
      first = mid + 1
    elif a[mid] > val:
      last = mid - 1
    else:
      return mid

  return -1
