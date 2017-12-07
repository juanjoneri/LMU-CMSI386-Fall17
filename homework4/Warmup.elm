module Warmup exposing (..)
import String exposing (toList, fromList)
import List exposing (concatMap, map, foldr, sum, filter)
import List exposing (reverse, map, repeat)
import Result exposing ( Result( Ok, Err ) )
import Html exposing (Html, ul, li, text)
import Regex exposing (..)
import Date exposing (..)


--change : Int -> List Int
coins =
    (25, 10, 5, 1)

change amount =
    if amount >= 0 then
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

stripQuotes : String -> String
stripQuotes =
    replace All (regex "['\"]") (\_ -> "")

powers : Int -> Int -> List Int
powers base limit =
    let accumulate pows =
        if limit < 1 then [] else
        case pows of
            x :: rest -> if base * x > limit then pows else accumulate (base * x::pows)
            _ -> []
    in
        reverse (accumulate [base, 1])

sumOfCubesOfOdds : List Int -> Int
sumOfCubesOfOdds lista =
    lista
        |> filter (\x -> x % 2 /= 0)
        |> map (\x -> x ^ 3)
        |> sum

millisecondsPerDay =
    24 * 60 * 60 * 1000


daysBetween  d1 d2 =
    case (d1 |> fromString, d2 |> fromString) of
        (Ok value1, Ok value2) -> Ok (((value2 |> toTime) - (value1 |> toTime)) / millisecondsPerDay)
        (Err _, Ok _) -> Err (d1 ++ " is not a date.")
        (Ok _, Err _) -> Err (d2 ++ " is not a date.")
        (Err _, Err _) -> Err ("Neither " ++ d1 ++ " nor " ++ d2 ++ " are dates.")
