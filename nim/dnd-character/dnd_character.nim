import std/[algorithm, math, random]
type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc rollDice: int =
  rand(5) + 1

proc ability*: int =
  [rollDice(),
   rollDice(),
   rollDice(),
   rollDice()]
  .sorted[1..3]
  .sum

proc modifier*(n: int): int =
  (n - 10).floorDiv(2)

proc initCharacter*: Character =
  let constitution = ability()
  Character(strength: ability(),
            dexterity: ability(),
            constitution: constitution,
            intelligence: ability(),
            wisdom: ability(),
            charisma: ability(),
            hitpoints: 10 + constitution.modifier)
