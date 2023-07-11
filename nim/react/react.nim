import std/sequtils

type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    unstable: int
    val: int
    dependencies: seq[Cell]
    dependendents: seq[Cell]
    callbacks: seq[Callback]
    compute: ComputeFunc

proc newInputCell*(val: int): Cell =
  Cell(val: val)

proc value*(cell: Cell): int =
  cell.val

proc update(cell: Cell) =
  for dep in cell.dependendents:
    dep.unstable = dep.compute(dep.dependencies.mapIt(it.unstable))
    dep.update
  
proc `value=`*(cell: Cell, val: int) =
  if cell.val == val:
    return
  cell.unstable = val
  for callback in cell.callbacks:
    callback(val)
  cell.update
  for dep in cell.dependendents:
    dep.value = dep.unstable
  cell.val = cell.unstable

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  let cell = Cell(dependencies: dependencies, compute: compute)
  cell.val = cell.compute(dependencies.mapIt(it.val))
  for dep in dependencies:
    dep.dependendents.add cell
  cell
  

proc addCallback*(cell: Cell, callback: Callback) =
  cell.callbacks.add callback

proc removeCallback*(cell: Cell, callback: Callback) =
  cell.callbacks = cell.callbacks.filterIt(it != callback)
