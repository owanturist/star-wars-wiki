module Types.UI exposing (UI, initialUI)

import Counter.Types


type alias UI =
    { counter : Counter.Types.Model
    }


initialUI : UI
initialUI =
    UI Counter.Types.initialModel
