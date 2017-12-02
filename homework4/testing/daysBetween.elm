import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)
import Date exposing (..)


daysBetween: String -> Bool
daysBetween  d1 =
    contains (regex "\\d{4}-\\d{2}-\\d{2}") d1

main =
      daysBetween "2016-02-27" |> toString |> text
