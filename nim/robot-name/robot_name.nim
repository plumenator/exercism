import std/[strutils, setutils, random]
type
  Name* = array[5, char]
  Robot* = object
    name*: Name

let letters = ('A'..'Z').toSet

proc makeRobot*: Robot =
  Robot(name:[sample(letters), sample(letters), sample(Digits), sample(Digits), sample(Digits)])

proc reset*(r: var Robot) =
  r.name = makeRobot().name
