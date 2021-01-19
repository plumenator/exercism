module Bob (responseFor) where

import Data.Char (isUpper, isAlpha, isSpace)
import Data.Text as T

responseFor :: Text -> Text
responseFor prompt = T.pack response where
  response
    | silence = "Fine. Be that way!"
    | question && yelling = "Calm down, I know what I'm doing!"
    | question = "Sure."
    | yelling = "Whoa, chill out!"
    | otherwise = "Whatever."
  silence = T.null nospaces
  question = T.last nospaces == '?'
  yelling = allUpper (T.filter isAlpha nospaces)
  allUpper text = not (T.null text) &&  T.all isUpper text
  nospaces = T.filter (not . isSpace) prompt
