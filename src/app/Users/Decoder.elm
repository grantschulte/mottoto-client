module Users.Decoder exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (User)
import Mottos.Decoder exposing (mottoDecoder)


-- USER DECODER


userDecoder : Decode.Decoder User
userDecoder =
    decode User
        |> required "_id" Decode.string
        |> required "email" Decode.string
        |> required "handle" Decode.string
        |> required "motto" mottoDecoder
        |> required "token" Decode.string
