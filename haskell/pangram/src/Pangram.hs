module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram = flip all "abcdefghijklmnopqrstuvwxyz"
            . flip elem
            . map toLower
