module State exposing (initial, update, subscriptions)

import Types exposing (Msg(..), Model)


initial : Cmd Msg
initial =
    Cmd.none


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
