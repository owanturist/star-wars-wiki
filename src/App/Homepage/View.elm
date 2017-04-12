module Homepage.View exposing (view)

import Html exposing (Html, a, div, h1, li, text, ul)
import Html.Attributes exposing (href)


view : Html a
view =
    div []
        [ h1 []
            [ text "Choise a category:"
            ]
        , ul []
            [ li []
                [ a [ href "#people/" ] [ text "People" ]
                ]
            , li []
                [ a [ href "#planets/" ] [ text "Planets" ]
                ]
            , li []
                [ a [ href "#films/" ] [ text "Films" ]
                ]
            , li []
                [ a [ href "#species/" ] [ text "Species" ]
                ]
            , li []
                [ a [ href "#vehicles/" ] [ text "Vehicles" ]
                ]
            , li []
                [ a [ href "#starships/" ] [ text "Starships" ]
                ]
            ]
        ]
