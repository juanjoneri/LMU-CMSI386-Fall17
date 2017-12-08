module Warmup exposing (..)
import String exposing (toList, fromList)
import List exposing (concatMap, map, foldr, sum, filter, rem)
import List exposing (reverse, map, repeat)
import Result exposing ( Result( Ok, Err ) )
import Html exposing (Html, ul, li, text)
import Regex exposing (..)
import Date exposing (..)

coins: (Int, Int, Int, Int)
coins =
    (25, 10, 5, 1)

divmod value modulo =
    value\\modulo rem value modulo

change : Int -> Result String ( Int, Int, Int, Int )
change amount =
    if amount >= 0 then
        let
            (quarters, afterQuarters) = divmod (amount, 25)
            (nickels, afterNickels) = divmod  (afterQuarters, 10)
            (dimmes, afterDimes) = divmod  (aferNickels, 5)
        in
            quarters nickels dimes afterDimes
    else
        Err "amount cannot be negative"

stripQuotes : String -> String
stripQuotes =
    replace All (regex "['\"]") (\_ -> "")

powers : Int -> Int -> Result String (List Int)
powers base limit =
    if base < 0 then Err "negative base" else

    let accumulate pows =
        if limit < 1 then [] else
        case pows of
            x :: rest -> if base * x > limit then pows else accumulate (base * x::pows)
            _ -> []
    in
        Ok (reverse (accumulate [base, 1]))


sumOfCubesOfOdds : List Int -> Int
sumOfCubesOfOdds lista =
    lista
        |> filter (\x -> x % 2 /= 0)
        |> map (\x -> x ^ 3)
        |> sum

daysBetween : String -> String -> Result String Float
daysBetween  d1 d2 =
    let millisecondsPerDay = 24 * 60 * 60 * 1000 in
        case (d1 |> fromString, d2 |> fromString) of
            (Ok value1, Ok value2) -> Ok (((value2 |> toTime) - (value1 |> toTime)) / millisecondsPerDay)
            (Err _, Ok _) -> Err (d1 ++ " is not a date.")
            (Ok _, Err _) -> Err (d2 ++ " is not a date.")
            (Err _, Err _) -> Err ("Neither " ++ d1 ++ " nor " ++ d2 ++ " are dates.")
