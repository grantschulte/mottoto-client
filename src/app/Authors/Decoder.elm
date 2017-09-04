module Authors.Decoder exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (Author)
import Mottos.Decoder exposing (mottoDecoder)


-- USER DECODER


authorDecoder : Decode.Decoder Author
authorDecoder =
    decode Author
        |> required "_id" Decode.string
        |> required "handle" Decode.string
        |> required "motto" mottoDecoder
