module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = foldr cons (Right []) . map toComplement where
  cons (Left c)  _ = Left c
  cons _ (Left c) = Left c
  cons (Right c) (Right cs) = Right (c : cs)

toComplement :: Char -> Either Char Char
toComplement 'G' = Right 'C'
toComplement 'C' = Right 'G'
toComplement 'T' = Right 'A'
toComplement 'A' = Right 'U'
toComplement  c  = Left c
