import Cylinder exposing (..)
import Html exposing (Html, ul, li, text)

main =
    stretch 5 Cylinder.new |> toString |> text
