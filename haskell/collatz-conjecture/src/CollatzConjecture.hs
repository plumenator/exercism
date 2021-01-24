module CollatzConjecture (collatz) where

import Data.List (genericLength, iterate')

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
collatz n = Just collatz' where
  collatz' = countUntil (== 1) $ iterate' step n
  step x | even x = x `quot` 2
         | otherwise = 3 * x + 1
  countUntil p = genericLength . takeWhile (not . p)
