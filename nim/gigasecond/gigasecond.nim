import std/times

proc addGigasecond*(dt: DateTime): DateTime =
  dt + 1_000_000_000.seconds
