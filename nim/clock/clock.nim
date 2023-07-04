import std/[strformat, math]

type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

proc initClock*(hour, minute: int): Clock =
  Clock(hour: (hour + minute.floorDiv(60)).floorMod(24),
        minute: minute.floorMod(60))

proc `$`*(c: Clock): string =
  &"{c.hour:02}:{c.minute:02}"

proc `+`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute + v.int)

proc `-`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute - v.int)
