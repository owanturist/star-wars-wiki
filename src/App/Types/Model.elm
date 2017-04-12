module Types.Model exposing (Model, initModel)

import Routes exposing (Route)
import Types.UI exposing (UI, initialUI)


type alias Model =
    { ui : UI
    , route : Route
    }


initModel : Route -> Model
initModel =
    Model
        initialUI
