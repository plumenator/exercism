module Bob (responseFor) where

import Data.Char (isUpper, isAlpha, isSpace)
import Data.Text as T

responseFor :: Text -> Text
responseFor prompt = T.pack response where
  response
    | silence nospaces = "Fine. Be that way!"
    | question nospaces = responseForQuestion
    | yelling nospaces = "Whoa, chill out!"
    | otherwise = "Whatever."
  responseForQuestion
    | yelling nospaces = "Calm down, I know what I'm doing!"
    | otherwise = "Sure."
  question = (== '?') . T.last 
  yelling = allUpper . T.filter isAlpha
  allUpper text = not (silence text) && T.all isUpper text
  silence = T.null
  nospaces = T.filter (not . isSpace) prompt
