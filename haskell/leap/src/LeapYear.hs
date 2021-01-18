module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = 4 `divides` year
                  && (not (100 `divides` year)
                      || 400 `divides` year)
  where
    divides x y = y `rem` x == 0
