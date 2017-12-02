module Warmup exposing (..)
import String exposing (toList, fromList)
import List exposing (concatMap, map, foldr)
import List exposing (reverse, map, repeat)
import Result exposing ( Result( Ok, Err ) )

change : Int -> List Int
change a =
    1

stripQuotes : Int -> Int
stripQuotes a =
    1

powers : Int -> Int -> List Int
powers base limit =
    let accumulate pows =
        if limit < 1 then [] else
        case pows of
            x :: rest -> if base * x > limit then pows else accumulate (base * x::pows)
            _ -> []
    in
    reverse (accumulate [base, 1])

sumOfCubesOfOdds : Int -> Int
sumOfCubesOfOdds a =
    1

daysBetween : Int -> Int
daysBetween a =
    1
