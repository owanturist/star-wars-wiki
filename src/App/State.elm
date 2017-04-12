module State exposing (init, update, subscriptions)

import Counter.State
import Navigation exposing (Location)
import Routes exposing (parseLocation)
import Types.Msg exposing (Msg(..))
import Types.Model exposing (Model, initModel)


init : Location -> ( Model, Cmd Msg )
init location =
    ( initModel (parseLocation location)
    , Cmd.batch
        [ Cmd.map CounterMsg Counter.State.initial
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ ui } as model) =
    case msg of
        OnLocationChange location ->
            ( { model | route = parseLocation location }
            , Cmd.none
            )

        CounterMsg counterMsg ->
            let
                ( nextCounter, counterCmd ) =
                    Counter.State.update counterMsg ui.counter

                nextUI =
                    { ui | counter = nextCounter }
            in
                ( { model | ui = nextUI }
                , Cmd.map CounterMsg counterCmd
                )


subscriptions : Model -> Sub Msg
subscriptions { ui } =
    Sub.batch
        [ Sub.map CounterMsg (Counter.State.subscriptions ui.counter)
        ]
