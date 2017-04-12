module Types exposing (Msg(..), Model, initModel)

import Routes exposing (Route, parseLocation)
import Counter.Types
import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | CounterMsg Counter.Types.Msg


type alias Model =
    { counter : Counter.Types.Model
    , route : Route
    }


initModel : Location -> Model
initModel =
    Model
        Counter.Types.initialModel
        << parseLocation
