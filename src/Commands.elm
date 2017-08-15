module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (..)
import Models exposing (ApiUrl, Author, AuthorHandle, Model, Route)
import RemoteData


-- FETCH AUTHOR


fetchAuthor : ApiUrl -> AuthorHandle -> Cmd Msg
fetchAuthor apiUrl authorHandle =
    Http.get (fetchAuthorUrl apiUrl authorHandle) authorDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchAuthor


fetchAuthorUrl : ApiUrl -> AuthorHandle -> String
fetchAuthorUrl apiUrl authorHandle =
    apiUrl ++ "/users?handle=" ++ authorHandle


authorDecoder : Decode.Decoder Author
authorDecoder =
    decode Author
        |> required "email" Decode.string
        |> required "handle" Decode.string
        |> required "motto" Decode.string



-- ON LOCATION CHANGE


onLocationChangeCommand : Model -> Route -> Cmd Msg
onLocationChangeCommand model route =
    case route of
        Models.AuthorRoute authorHandle ->
            fetchAuthor model.apiUrl authorHandle

        _ ->
            Cmd.none



-- ON INIT


onInitCommand : Model -> Route -> Cmd Msg
onInitCommand model route =
    case route of
        Models.AuthorRoute authorHandle ->
            fetchAuthor model.apiUrl authorHandle

        _ ->
            Cmd.none
