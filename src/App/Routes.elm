module Routes exposing (Route(..), parseLocation)

import UrlParser exposing (Parser, map, oneOf, parseHash, s, top)
import Navigation exposing (Location)


type Route
    = Homepage
    | Counter
    | NotFound


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Homepage top
        , map Counter (s "counter")
        ]


parseLocation : Location -> Route
parseLocation =
    Maybe.withDefault NotFound << parseHash matchers
