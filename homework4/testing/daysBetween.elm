import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)
import Date exposing (..)

datePat = regex "(\\d{4})-(\\d{2})-(\\d{2})"

daysBetween  d1 d2 =
    if contains datePat d1 && contains datePat d2
    then
        1
    else
        0

main =
      daysBetween "2016-02-27" "2016-03-01" |> toString |> text
