module Pangram (isPangram) where

import Data.Char (isAlpha, toLower, isAscii)
import Data.List (nub, sort)

isPangram :: String -> Bool
isPangram = (== "abcdefghijklmnopqrstuvwxyz")
            . sort
            . nub
            . map toLower
            . filter isAscii
            . filter isAlpha
