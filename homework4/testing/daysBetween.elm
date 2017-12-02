import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)
import Date exposing (..)

datePat = regex "(\\d{4})-(\\d{2})-(\\d{2})"

daysBetween  d1 d2 =
    if contains datePat d1 && contains datePat d2
    then
        case (d1 |> fromString, d2 |> fromString) of
            (Ok value1, Ok value2) -> Err "1"
            (Err msg1, Ok value2) -> Err "2"
            (Ok value1, Err msg2) -> Err "3"
            (Err msg1, Err msg2) -> Err msg1
    else
        Err "msg"

main =
      daysBetween "2016-02-27" "2016-03-01" |> toString |> text
