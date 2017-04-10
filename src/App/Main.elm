module Main exposing (main)

import Navigation
import Types exposing (Msg(OnLocationChange), Model)
import State exposing (init, update, subscriptions)
import View exposing (view)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
