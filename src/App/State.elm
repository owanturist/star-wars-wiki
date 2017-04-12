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
