module Cylinder exposing (cylinder)
import String exposing (toList, fromList)
import List exposing (concatMap, map, foldr)

insertEverywhere : a -> List a -> List (List a)
insertEverywhere x xs =
    case xs of
        [] -> [[x]]
        (y::ys) -> (x::y::ys) :: map ((::)y) (insertEverywhere x ys)

permutations : List a -> List (List a)
permutations =
    foldr (concatMap << insertEverywhere) [[]]

cylinder : String -> List String
cylinder s =
    s |> toList |> permutations |> map fromList
