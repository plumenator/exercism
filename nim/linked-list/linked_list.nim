type
  LinkedList*[T] = ref object ## A doubly linked list.
    first: Node[T]
    last: Node[T]
    count: int

  Node[T] = ref object ## A doubly linked list.
    next: Node[T]
    prev: Node[T]
    val: T

proc len*[T](list: LinkedList[T]): int =
  ## Returns the number of nodes in `list`.
  list.count

proc push*[T](list: var LinkedList[T], val: T) =
  ## Appends a node with the given `val` to `list`.
  let node = Node[T](val: val)
  list.count.inc

  if list.first == nil:
    list.first = node
    list.last = node
    return

  if list.last != nil:
    list.last.next = node
  node.prev = list.last
  list.last = node

proc pop*[T](list: var LinkedList[T]): T =
  ## Removes the final node of `list` and returns its value.
  let val = list.last.val
  if list.last.prev != nil:
    list.last.prev.next = nil
  list.last = list.last.prev
  list.count.dec
  val

proc shift*[T](list: var LinkedList[T]): T =
  ## Removes the first node of `list` and returns its value.
  let val = list.first.val
  list.first.prev = nil
  list.first = list.first.next
  list.count.dec
  val

proc unshift*[T](list: var LinkedList[T], val: T) =
  ## Prepends a node with the given `val` to `list`.
  let node = Node[T](val: val)
  list.count.inc

  if list.first == nil:
    list.first = node
    return

  node.next = list.first
  list.first.prev = node
  list.first = node
  
proc delete*[T](list: var LinkedList[T], val: T) =
  ## Removes a node with value `val` from `list`.
  var curr = list.first
  while curr != nil:
    if curr.val == val:
      if curr == list.last:
        discard list.pop
      elif curr == list.first:
        discard list.shift
      else:
        if curr.prev != nil:
          curr.prev.next = curr.next
        if curr.next != nil:
          curr.next.prev = curr.prev
          list.count.dec
      return
    curr = curr.next
