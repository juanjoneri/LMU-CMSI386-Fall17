import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)
import Regex exposing (..)

square x =
    x * x

odd x =
    x % 2 == 0

sumOfCubesOfOdds : List Int -> Int
sumOfCubesOfOdds lista =
    lista
        |> filter odd
        |> map square
        |> sum


main =
      text (sumOfCubesOfOdds [1,2,3,4,5] |> toString )



-- \  |> filter odd
--    |> map square
--    |> sum
