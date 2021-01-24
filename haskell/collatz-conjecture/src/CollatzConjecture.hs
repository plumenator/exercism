module CollatzConjecture (collatz) where

import Data.List (genericLength, iterate')

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
collatz n = Just collatz' where
  collatz' = countUntil (== 1) $ iterate' step n
  step x  = if r == 0 then q else 3 * x + 1 where
    (q, r) = quotRem x 2
  countUntil p = genericLength . takeWhile (not . p)
