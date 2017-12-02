import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)
import Date exposing (..)

coins =
    (25, 10, 5, 1)

change amount =
    if amount > 0 then
        let
            makeChange remainder q d n p =
                if remainder == 0 then
                    Ok (q d n p)
                else if remainder-25 >= 0 then
                    makeChange (remainder-25) (q+1) d n p
                else if remainder-10 >= 0 then
                    makeChange (remainder-10) q (d+1) n p
                else if remainder-5 >= 0 then
                    makeChange (remainder-5) q d (n+1) p
                else
                    makeChange (remainder-1) q d n (p+1)
        in
            makeChange amount 0 0 0 0
    else
        Err "amount cannot be negative"

main =
      change 219 |> toString |> text
