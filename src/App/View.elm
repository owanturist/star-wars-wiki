module View exposing (view)

import Html exposing (Html, div, text)
import Types.Msg exposing (Msg(..))
import Types.Model exposing (Model)
import Routes exposing (Route(..))
import Counter.View


view : Model -> Html Msg
view { route, ui } =
    case route of
        Homepage ->
            div [] [ text "It is homepage" ]

        Counter ->
            div []
                [ Html.map CounterMsg <| Counter.View.view ui.counter
                ]

        NotFound ->
            div [] [ text "404 - Not found." ]
