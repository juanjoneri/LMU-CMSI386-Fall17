import Html exposing (Html, ul, li, text)
import List exposing (reverse, map, repeat)

powers : Int -> Int -> List Int
powers base limit =
    let accumulate pows =
        if limit < 1 then [] else
        case pows of
            x :: rest -> if base * x > limit then pows else accumulate (base * x::pows)
            _ -> []
    in
        reverse (accumulate [base, 1])

main : Html Never
main =
      powers 3 23143435 |> map (toString >> text >> repeat 1 >> li []) |> ul []
