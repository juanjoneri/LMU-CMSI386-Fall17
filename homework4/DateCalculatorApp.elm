-- Read all about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/forms.html

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Date exposing (..)
import Warmup exposing (daysBetween)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL


type alias Model =
  { from : String
  , to : String
  }


model : Model
model =
  Model "" ""


-- UPDATE


type Msg
    = From String
    | To String

update : Msg -> Model -> Model
update msg model =
  case msg of
    From from ->
      { model | from = from }

    To to ->
      { model | to = to }

-- VIEW

view : Model -> Html Msg
view model =
  body [ bodyStyle ]
    [ h1 [ titleStyle ] [ text "Date Calculator" ]
    , p [ ]
        [ text "From "
        , input
            [ inputStyle
            , type_ "date"
            , placeholder "From"
            , onInput From
            ] [ ]
        ]
    , p [ ]
        [ text "to "
        , input
            [ inputStyle
            , type_ "date"
            , placeholder "To"
            , onInput To ] [ ]
        ]
    , p [ ]
        [ text "is "
        , span [ outputStyle ] [ viewValidation model ]
        , text " days"
        ]
    ]

bodyStyle =
    style
        [ ("text-align", "center")
        , ("font", "16px Arial")
        , ("background-color", "linen")
        , ("margin", "0") ]

titleStyle =
    style
        [ ("background-color", "cyan")
        , ("font", "bold 40px Avenir")
        , ("margin-top", "0")
        , ("padding", "5px") ]

inputStyle =
    style
        [ ("border", "2px solid grey")
        , ("margin-left", "8px") ]

outputStyle =
    style [ ("font-size", "28px") ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    distance =
      case daysBetween model.from model.to of
          Ok d -> (d |> toString)
          Err _ -> ""
  in
    distance |> text



-- millisecondsPerDay =
--     24 * 60 * 60 * 1000
-- daysBetween  d1 d2 =
--     case (d1 |> fromString, d2 |> fromString) of
--         (Ok value1, Ok value2) -> Ok (((value2 |> toTime) - (value1 |> toTime)) / millisecondsPerDay)
--         (Err _, Ok _) -> Err (d1 ++ " is not a date.")
--         (Ok _, Err _) -> Err (d2 ++ " is not a date.")
--         (Err _, Err _) -> Err ("Neither " ++ d1 ++ " nor " ++ d2 ++ " are dates.")
