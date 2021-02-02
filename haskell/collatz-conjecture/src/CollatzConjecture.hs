module CollatzConjecture (collatz) where

import Data.List (elemIndex, iterate')

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
collatz n = fmap fromIntegral . elemIndex 1 $ iterate' step n where
  step x  = if r == 0 then q else 3 * x + 1 where
    (q, r) = quotRem x 2
