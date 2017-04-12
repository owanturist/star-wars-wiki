module Entities.Personage exposing (Personage, decode)

import Json.Decode as Decode exposing (Decoder, list, string, succeed)
import Json.Decode.Pipeline exposing (required)


type alias Personage =
    { url : String
    , name : String
    , height : Int
    , mass : Int
    , hair : String
    , skin : String
    , eyes : String
    , birth : String
    , gender : String
    , homeworld : String
    , films : List String
    , species : List String
    , vehicles : List String
    , starships : List String
    }


decode : Decoder Personage
decode =
    succeed Personage
        |> required "url" string
        |> required "name" string
        |> required "height" (Decode.map (Result.withDefault 0 << String.toInt) string)
        |> required "mass" (Decode.map (Result.withDefault 0 << String.toInt) string)
        |> required "hair_color" string
        |> required "skin_color" string
        |> required "eye_color" string
        |> required "birth_year" string
        |> required "gender" string
        |> required "homeworld" string
        |> required "films" (list string)
        |> required "species" (list string)
        |> required "vehicles" (list string)
        |> required "starships" (list string)
