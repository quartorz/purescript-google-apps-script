module GoogleAppsScript.SpreadsheetApp where

import Prelude

import Data.JSDate (JSDate)
import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn5, runEffectFn1, runEffectFn2, runEffectFn5)
import Foreign (Foreign)
import Unsafe.Coerce (unsafeCoerce)

foreign import data Spreadsheet :: Type

foreign import data Sheet :: Type

foreign import data Range :: Type

foreign import data SheetValue :: Type

data Value
  = Str String
  | Num Number
  | Date JSDate

newtype Row
  = Row Int

newtype Column
  = Column Int

foreign import openByIdImpl :: EffectFn1 String (Nullable Spreadsheet)

foreign import getSheetByNameImpl :: EffectFn2 Spreadsheet String (Nullable Sheet)

foreign import getRangeImpl :: EffectFn5 Sheet Int Int Int Int Range

foreign import getDisplayValuesImpl :: EffectFn1 Range (Array (Array String))

foreign import getValuesImpl :: EffectFn1 Range (Array (Array SheetValue))

foreign import isString :: forall a. a -> Boolean

foreign import isNumber :: forall a. a -> Boolean

openById :: String -> Effect (Nullable Spreadsheet)
openById = runEffectFn1 openByIdImpl

getSheetByName :: Spreadsheet -> String -> Effect (Nullable Sheet)
getSheetByName = runEffectFn2 getSheetByNameImpl

getRange :: Sheet -> Row -> Column -> Int -> Int -> Effect Range
getRange s (Row r) (Column c) = runEffectFn5 getRangeImpl s r c

getRange' :: Sheet -> Row -> Column -> Effect Range
getRange' s r c = getRange s r c 1 1

getDisplayValues :: Range -> Effect (Array (Array String))
getDisplayValues = runEffectFn1 getDisplayValuesImpl

getValues :: Range -> Effect (Array (Array SheetValue))
getValues = runEffectFn1 getValuesImpl

toValue :: Foreign -> Value
toValue v
  | isString v = Str $ unsafeCoerce v
  | isNumber v = Num $ unsafeCoerce v
  | otherwise = Date $ unsafeCoerce v
