module Main exposing (main)

import Html
import Types exposing (Msg, Model, initialModel)
import State exposing (initial, update, subscriptions)
import View exposing (view)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, initial )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
