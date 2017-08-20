module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (..)
import Models exposing (ApiUrl, Model, Motto, MottoId, Route, User, UserId)
import RemoteData


-- FETCH MOTTO


fetchMotto : ApiUrl -> MottoId -> Cmd Msg
fetchMotto apiUrl mottoId =
    Http.get (fetchMottoUrl apiUrl mottoId) mottoDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchMotto


fetchMottoUrl : ApiUrl -> MottoId -> String
fetchMottoUrl apiUrl mottoId =
    apiUrl ++ "/mottos/" ++ toString mottoId ++ "?_expand=user"


mottoDecoder : Decode.Decoder Motto
mottoDecoder =
    decode Motto
        |> required "id" Decode.int
        |> required "text" Decode.string



-- FETCH MOTTO LIST
-- fetchMottoList : ApiUrl -> Cmd Msg
-- fetchMottoList apiUrl =
--     Http.get (fetchMottoListUrl apiUrl) mottoListDecoder
--         |> RemoteData.sendRequest
--         |> Cmd.map OnFetchMottoList
--
--
-- fetchMottoListUrl : ApiUrl -> String
-- fetchMottoListUrl apiUrl =
--     apiUrl ++ "/mottos" ++ "?_expand=user"
--
--
-- mottoListDecoder : Decode.Decoder (List Motto)
-- mottoListDecoder =
--     Decode.list mottoDecoder
-- FETCH USER


fetchUser : ApiUrl -> UserId -> Cmd Msg
fetchUser apiUrl userId =
    Http.get (fetchUserUrl apiUrl userId) userDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchUser


fetchUserUrl : ApiUrl -> UserId -> String
fetchUserUrl apiUrl userId =
    apiUrl ++ "/users/" ++ toString userId ++ "?_expand=motto"


userDecoder : Decode.Decoder User
userDecoder =
    decode User
        |> required "id" Decode.int
        |> required "email" Decode.string
        |> required "handle" Decode.string
        |> required "motto" mottoDecoder



-- FETCH USER LIST


fetchUserList : ApiUrl -> Cmd Msg
fetchUserList apiUrl =
    Http.get (fetchUserListUrl apiUrl) userListDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchUserList


fetchUserListUrl : ApiUrl -> String
fetchUserListUrl apiUrl =
    apiUrl ++ "/users" ++ "?_expand=motto"


userListDecoder : Decode.Decoder (List User)
userListDecoder =
    Decode.list userDecoder



-- ON LOCATION CHANGE


onLocationChangeCommand : Model -> Route -> Cmd Msg
onLocationChangeCommand model route =
    case route of
        Models.BrowseRoute ->
            fetchUserList model.apiUrl

        Models.AuthorRoute userId ->
            fetchUser model.apiUrl userId

        _ ->
            Cmd.none
