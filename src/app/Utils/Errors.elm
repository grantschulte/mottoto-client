module Utils.Errors exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (..)


genericError : String
genericError =
    "We couldn't complete your request. Try again later."


httpError : Error -> String
httpError error =
    case error of
        BadUrl text ->
            text

        Timeout ->
            genericError

        NetworkError ->
            "Network Error"

        BadStatus response ->
            case Decode.decodeString (Decode.field "message" Decode.string) response.body of
                Err a ->
                    genericError

                Ok result ->
                    result

        BadPayload message response ->
            toString message



-- errorDecoder : Decode.Decoder -> ErrorResponse
-- errorDecoder =
--     decode ErrorResponse
--         |> required "status" Decode.string
--         |> required "message" Decode.string
