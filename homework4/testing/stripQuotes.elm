import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, repeat)
import Regex exposing (..)

stripQuotes : String -> String
stripQuotes =
    replace All (regex "['\"]") (\_ -> "")

main =
      stripQuotes "''\"\"a'''"  |> text
