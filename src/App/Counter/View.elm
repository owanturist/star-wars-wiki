module Counter.View exposing (view)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Counter.Types exposing (Msg(..), Model)


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ]
            [ text "-"
            ]
        , text (toString model)
        , button [ onClick Increment ]
            [ text "+"
            ]
        ]
