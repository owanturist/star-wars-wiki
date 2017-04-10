module Types exposing (Msg(..), Model, initialModel)

import Counter.Types


type Msg
    = CounterMsg Counter.Types.Msg


type alias Model =
    { counter : Counter.Types.Model
    }


initialModel : Model
initialModel =
    Model
        Counter.Types.initialModel
