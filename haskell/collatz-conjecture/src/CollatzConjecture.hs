module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
collatz n = Just collatz' where
  collatz' = len . takeWhile (/= 1) $ scanl (flip ($)) n (repeat step)
  step x | even x = x `div` 2
         | otherwise = 3 * x + 1
  len = sum . map (const 1)
