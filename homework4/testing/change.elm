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
                    Ok (q, n, d, p)
                else if remainder >= 25 then
                    makeChange (remainder//25) n d p (remainder%25)
                else if remainder >= 10 then
                    makeChange q (remainder//10) d p (remainder%10)
                else if remainder >= 5 then
                    makeChange q n (remainder//5) p (remainder%5)
                else
                    makeChange q n d (p+1) (remainder-1)
        in
            makeChange 0 0 0 0 amount
    else
        Err "amount cannot be negative"

main =
      change 219 |> toString |> text
