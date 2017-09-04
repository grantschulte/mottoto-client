module Authors.Commands exposing (..)

import Authors.Decoder exposing (authorDecoder)
import Http
import Json.Decode as Decode
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


-- FETCH USER


fetchAuthor : ApiUrl -> UserHandle -> Cmd Msg
fetchAuthor apiUrl userHandle =
    Http.get (fetchAuthorUrl apiUrl userHandle) authorDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchAuthor


fetchAuthorUrl : ApiUrl -> UserHandle -> String
fetchAuthorUrl apiUrl userHandle =
    apiUrl ++ "/authors/" ++ userHandle



-- FETCH USER LIST


fetchAuthors : ApiUrl -> Cmd Msg
fetchAuthors apiUrl =
    Http.get (fetchAuthorsUrl apiUrl) authorsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchAuthors


fetchAuthorsUrl : ApiUrl -> String
fetchAuthorsUrl apiUrl =
    apiUrl ++ "/authors"


authorsDecoder : Decode.Decoder (List Author)
authorsDecoder =
    Decode.list authorDecoder
