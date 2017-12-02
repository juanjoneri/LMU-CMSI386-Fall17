import Cylinder exposing (..)
import Html exposing (Html, ul, li, text)

main =
    Cylinder.new |> volume |> toString |> text
