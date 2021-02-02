module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA =  mapM toComplement

toComplement :: Char -> Either Char Char
toComplement 'G' = Right 'C'
toComplement 'C' = Right 'G'
toComplement 'T' = Right 'A'
toComplement 'A' = Right 'U'
toComplement  c  = Left c
