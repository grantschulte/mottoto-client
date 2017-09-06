module Utils.Errors exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (..)
import Json.Decode as Decode
import Messages exposing (..)
import String exposing (..)


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


errorElement : Maybe String -> Html Msg
errorElement error =
    case error of
        Nothing ->
            text ""

        Just message ->
            div [ class "errors" ] (List.map errorItem (String.lines message))


errorItem : String -> Html Msg
errorItem message =
    div [] [ text message ]
