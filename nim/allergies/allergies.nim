import std/math

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc twoPowers(score: int): seq[int] =
  var total = score
  var powers = newSeq[int]()
  while total > 0:
    var power = log2(total.float32).floor.int
    powers.add(power)
    total -= 2 ^ power

  powers
    
proc isAllergicTo*(score: int, allergen: Allergen): bool =
  ord(allergen) in twoPowers(score)

proc allergies*(score: int): set[Allergen] =
  var have: set[Allergen] = {}
  var all = twoPowers(score)
  for allergen in Eggs..Cats:
    if ord(allergen) in all:
      have = have + {allergen}
  have
