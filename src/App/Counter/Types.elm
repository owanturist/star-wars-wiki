module Counter.Types exposing (Msg(..), Model, initialModel)


type Msg
    = Increment
    | Decrement


type alias Model =
    Int


initialModel : Model
initialModel =
    0
