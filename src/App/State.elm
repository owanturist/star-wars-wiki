module State exposing (initial, update, subscriptions)

import Types exposing (Msg(..), Model)
import Counter.State


initial : Cmd Msg
initial =
    Cmd.batch
        [ Cmd.map CounterMsg Counter.State.initial
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ counter } as model) =
    case msg of
        CounterMsg counterMsg ->
            let
                ( nextCounter, counterCmd ) =
                    Counter.State.update counterMsg counter
            in
                ( { model | counter = nextCounter }
                , Cmd.map CounterMsg counterCmd
                )


subscriptions : Model -> Sub Msg
subscriptions { counter } =
    Sub.batch
        [ Sub.map CounterMsg (Counter.State.subscriptions counter)
        ]
