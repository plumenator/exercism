import std/times

proc addGigasecond*(dt: DateTime): DateTime =
  dt + initDuration(seconds = 1000 * 1000 * 1000)
