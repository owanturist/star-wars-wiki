module View exposing (view)

import Html exposing (Html, div, text)
import Types exposing (Msg(..), Model)
import Routes exposing (Route(..))
import Counter.View


view : Model -> Html Msg
view { route, counter } =
    case route of
        Homepage ->
            div [] [ text "It is homepage" ]

        Counter ->
            div []
                [ Html.map CounterMsg <| Counter.View.view counter
                ]

        NotFound ->
            div [] [ text "404 - Not found." ]
