import std/[sequtils, tables, algorithm, math]
type
  Category* = enum
    Ones, Twos, Threes, Fours, Fives, Sixes,
    FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

proc score*(dice: array[5, int], category: Category): int =
  let counts = dice.toCountTable
  case category
  of Ones..Sixes:
    counts[category.ord] * category.ord
  of FullHouse:
    if counts.len == 2 and
       counts.values.toSeq.sorted == @[2, 3]:
      dice.sum
    else:
      0
  of FourOfAKind:
    counts.pairs.toSeq.filterIt(it[1] >= 4).mapIt(it[0] * 4).sum
  of LittleStraight:
    if dice.sorted == @[1, 2, 3, 4, 5]:
      30
    else:
      0
  of BigStraight:
    if dice.sorted == @[2, 3, 4, 5, 6]:
      30
    else:
      0
  of Choice:
    dice.sum
  of Yacht:
    if counts.len == 1:
      50
    else:
      0
