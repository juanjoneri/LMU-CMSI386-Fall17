-- Read all about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/forms.html

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


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
      if model.from == model.to then
        ("green", "is days")
      else
        ("red", "is days")
  in
    div [ style [("color", color)] ] [ text message ]
