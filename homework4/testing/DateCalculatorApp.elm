-- Read all about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/forms.html

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Date exposing (..)

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
  div []
    [ input [ type_ "text", placeholder "From", onInput From ] []
    , input [ type_ "to", placeholder "To", onInput To ] []
    , viewValidation model
    ]


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      case daysBetween model.from model.to of
          Ok d -> ("green", "is " ++ (d |> toString) ++ " days")
          Err _ -> ("red", "is days")
  in
    div [ style [("color", color)] ] [ text message ]



millisecondsPerDay =
    24 * 60 * 60 * 1000
daysBetween  d1 d2 =
    case (d1 |> fromString, d2 |> fromString) of
        (Ok value1, Ok value2) -> Ok (((value2 |> toTime) - (value1 |> toTime)) / millisecondsPerDay)
        (Err _, Ok _) -> Err (d1 ++ " is not a date.")
        (Ok _, Err _) -> Err (d2 ++ " is not a date.")
        (Err _, Err _) -> Err ("Neither " ++ d1 ++ " nor " ++ d2 ++ " are dates.")
