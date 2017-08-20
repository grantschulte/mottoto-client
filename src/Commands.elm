module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (..)
import Models exposing (ApiUrl, Model, Motto, MottoId, Route)
import RemoteData


-- FETCH AUTHOR


fetchMotto : ApiUrl -> MottoId -> Cmd Msg
fetchMotto apiUrl mottoId =
    Http.get (fetchMottoUrl apiUrl mottoId) mottoDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchMotto


fetchMottoUrl : ApiUrl -> MottoId -> String
fetchMottoUrl apiUrl mottoId =
    apiUrl ++ "/mottos/" ++ toString mottoId


mottoDecoder : Decode.Decoder Motto
mottoDecoder =
    decode Motto
        |> required "id" Decode.int
        |> required "text" Decode.string
        |> required "userId" Decode.int



-- ON LOCATION CHANGE


onLocationChangeCommand : Model -> Route -> Cmd Msg
onLocationChangeCommand model route =
    case route of
        Models.MottoDetailRoute mottoId ->
            fetchMotto model.apiUrl mottoId

        _ ->
            Cmd.none



-- ON INIT


onInitCommand : Model -> Route -> Cmd Msg
onInitCommand model route =
    case route of
        Models.MottoDetailRoute mottoId ->
            fetchMotto model.apiUrl mottoId

        _ ->
            Cmd.none
