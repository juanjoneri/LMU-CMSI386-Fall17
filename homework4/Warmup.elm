module Warmup exposing (..)
import String exposing (toList, fromList)
import List exposing (concatMap, map, foldr, sum, filter)
import List exposing (reverse, map, repeat)
import Result exposing ( Result( Ok, Err ) )
import Html exposing (Html, ul, li, text)
import Regex exposing (regex, replace)
import Date exposing (fromString, toTime)

coins: (Int, Int, Int, Int)
coins =
    (25, 10, 5, 1)

divmod: Int -> Int -> (Int, Int)
divmod value modulo =
    (value // modulo, value % modulo)

change : Int -> Result String ( Int, Int, Int, Int )
change amount =
    if amount >= 0 then
        let
            (quarters, afterQuarters) = divmod amount 25
            (nickels, aferNickels) = divmod  afterQuarters 10
            (dimmes, pennies) = divmod  aferNickels 5
        in
            Ok (quarters, nickels, dimmes, pennies)
    else
        Err "amount cannot be negative"

stripQuotes : String -> String
stripQuotes =
    replace Regex.All (regex "['\"]") (\_ -> "")

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
sumOfCubesOfOdds numbers =
    numbers
        |> filter (\x -> x % 2 /= 0)
        |> map (\x -> x ^ 3)
        |> sum

daysBetween : String -> String -> Result String Float
daysBetween  date1 date2 =
    let millisecondsPerDay = 24 * 60 * 60 * 1000 in
        case (date1 |> fromString, date2 |> fromString) of
            (Ok value1, Ok value2) -> Ok (((value2 |> toTime) - (value1 |> toTime)) / millisecondsPerDay)
            (Err _, Ok _) -> Err (date1 ++ " is not a date.")
            (Ok _, Err _) -> Err (date2 ++ " is not a date.")
            (Err _, Err _) -> Err ("Neither " ++ date1 ++ " nor " ++ date2 ++ " are dates.")
