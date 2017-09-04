module Mottos.Decoder exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (Motto)


-- MOTTO DECODER


mottoDecoder : Decode.Decoder Motto
mottoDecoder =
    decode Motto
        |> required "_id" Decode.string
        |> required "text" Decode.string
        |> required "user" Decode.string
