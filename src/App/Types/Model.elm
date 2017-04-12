module Types.Model exposing (Model, initModel)

import Routes exposing (Route)
import Types.UI exposing (UI, initialUI)
import Types.Data exposing (Data, initialData)


type alias Model =
    { ui : UI
    , data : Data
    , route : Route
    }


initModel : Route -> Model
initModel =
    Model
        initialUI
        initialData
