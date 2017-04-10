module View exposing (view)

import Html exposing (Html, div)
import Types exposing (Msg(..), Model)
import Counter.View


view : Model -> Html Msg
view { counter } =
    div []
        [ Html.map CounterMsg <| Counter.View.view counter
        ]
