module Types.Msg exposing (Msg(..))

import Counter.Types
import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | CounterMsg Counter.Types.Msg
