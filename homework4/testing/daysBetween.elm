import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)
import Date exposing (..)

millisecondsPerDay =
    24 * 60 * 60 * 1000


daysBetween  d1 d2 =
    case (d1 |> fromString, d2 |> fromString) of
        (Ok value1, Ok value2) -> Ok (((value1 |> toTime) - (value2 |> toTime)) / millisecondsPerDay)
        (Err msg1, Ok value2) -> Err (d1 ++ " is not a date.")
        (Ok value1, Err msg2) -> Err (d2 ++ " is not a date.")
        (Err msg1, Err msg2) -> Err ("Neither " ++ d1 ++ " nor " ++ d2 ++ " are dates.")

main =
      daysBetween "2016-02-27" "2016-03-01" |> toString |> text
