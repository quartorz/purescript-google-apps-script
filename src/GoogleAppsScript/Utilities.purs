module GoogleAppsScript.Utilities where

import Data.Function.Uncurried (Fn3, runFn3)
import Data.JSDate (JSDate)

foreign import formatDateImpl :: Fn3 JSDate String String String

formatDate :: JSDate -> String -> String
formatDate d f = runFn3 formatDateImpl d "Asia/Tokyo" f
