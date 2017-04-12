module Types.Model exposing (Model, initModel)

import Routes exposing (Route)
import Counter.Types


type alias Model =
    { counter : Counter.Types.Model
    , route : Route
    }


initModel : Route -> Model
initModel =
    Model
        Counter.Types.initialModel
