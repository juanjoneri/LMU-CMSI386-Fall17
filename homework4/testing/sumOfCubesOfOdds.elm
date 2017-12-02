import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, sum, filter)

sumOfCubesOfOdds : List Int -> Int
sumOfCubesOfOdds lista =
    lista
        |> filter (\x -> x % 2 /= 0)
        |> map (\x -> x ^ 3)
        |> sum

main =
      sumOfCubesOfOdds [-3, 2, -8, 5, -1] |> toString |> text



-- \  |> filter odd
--    |> map square
--    |> sum
