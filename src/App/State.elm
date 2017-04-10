module State exposing (init, update, subscriptions)

import Counter.State
import Navigation exposing (Location)
import Routes exposing (parseLocation)
import Types exposing (Model, Msg(..), initModel)


init : Location -> ( Model, Cmd Msg )
init location =
    ( initModel location
    , Cmd.batch
        [ Cmd.map CounterMsg Counter.State.initial
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ counter } as model) =
    case msg of
        OnLocationChange location ->
            ( { model | route = parseLocation location }
            , Cmd.none
            )

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
