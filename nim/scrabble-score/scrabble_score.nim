import std/[sequtils, strutils, math, tables]

const ScoreTable = {'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' : 1,
                    'D', 'G': 2,
                    'B', 'C', 'M', 'P': 3,
                    'F', 'H', 'V', 'W', 'Y': 4,
                    'K': 5,
                    'J', 'X': 8,
                    'Q', 'Z': 10}.toTable

proc score*(word: string): int = 
  word.toUpperAscii.mapIt(ScoreTable[it]).sum
