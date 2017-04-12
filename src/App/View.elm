module View exposing (view)

import Counter.View
import Homepage.View
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Routes exposing (Route(..))
import Types.Model exposing (Model)
import Types.Msg exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ viewRoute model
        ]


viewRoute : Model -> Html Msg
viewRoute { route, ui } =
    case route of
        Homepage ->
            Homepage.View.view

        Counter ->
            div []
                [ Html.map CounterMsg <| Counter.View.view ui.counter
                ]

        NotFound ->
            div [] [ text "404 - Not found." ]
