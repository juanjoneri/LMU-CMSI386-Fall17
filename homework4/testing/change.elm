import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)
import Date exposing (..)

coins =
    (25, 10, 5, 1)

change amount =
    if amount > 0 then
        let
            makeChange q n d p remainder =
                if remainder == 0 then
                    Ok (p)
                else
                    makeChange q n d (p+1) (remainder-1)
        in
            makeChange 0 0 0 0 amount
    else
        Err "amount cannot be negative"

main =
      change 219 |> toString |> text
