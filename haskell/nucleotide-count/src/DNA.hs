module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, empty, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = fmap count (parse xs)

count :: [Nucleotide] -> Map Nucleotide Int
count = foldr (flip (insertWith (+)) 1) empty

parse :: String -> Either String [Nucleotide]
parse = mapM parse' where
  parse' c = case c of
               'A' -> Right A
               'C' -> Right C
               'G' -> Right G
               'T' -> Right T
               _   -> Left ("Invalid character: " ++ [c])
