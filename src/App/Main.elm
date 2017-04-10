module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = Increment
    | Decrement


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ]
            [ text "-"
            ]
        , text (toString model)
        , button [ onClick Increment ]
            [ text "+"
            ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
