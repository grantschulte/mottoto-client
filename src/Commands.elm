module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import Messages exposing (..)
import Models exposing (ApiUrl, AuthorizedUser, Model, Motto, MottoId, Route, User, UserId)
import RemoteData


-- FETCH MOTTO


fetchMotto : ApiUrl -> AuthorizedUser -> Cmd Msg
fetchMotto apiUrl user =
    Http.get (fetchMottoUrl apiUrl user.mottoId) mottoDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchMotto


fetchMottoUrl : ApiUrl -> MottoId -> String
fetchMottoUrl apiUrl mottoId =
    apiUrl ++ "/mottos/" ++ mottoId


mottoDecoder : Decode.Decoder Motto
mottoDecoder =
    decode Motto
        |> required "id" Decode.string
        |> required "text" Decode.string



-- FETCH USER


fetchUser : ApiUrl -> UserId -> Cmd Msg
fetchUser apiUrl userId =
    Http.get (fetchUserUrl apiUrl userId) userDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchUser


fetchUserUrl : ApiUrl -> UserId -> String
fetchUserUrl apiUrl userId =
    apiUrl ++ "/users/" ++ userId ++ "?_expand=motto"


userDecoder : Decode.Decoder User
userDecoder =
    decode User
        |> required "id" Decode.string
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



-- UPDATE MOTTO


saveMottoCmd : Model -> Motto -> Cmd Msg
saveMottoCmd model motto =
    saveMottoRequest model.apiUrl motto
        |> Http.send OnSaveMotto


saveMottoRequest : ApiUrl -> Motto -> Http.Request Motto
saveMottoRequest apiUrl motto =
    Http.request
        { body = mottoEncoder motto |> Http.jsonBody
        , expect = Http.expectJson mottoDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveMottoUrl apiUrl motto.id
        , withCredentials = False
        }


saveMottoUrl : ApiUrl -> MottoId -> String
saveMottoUrl apiUrl mottoId =
    apiUrl ++ "/mottos/" ++ mottoId


mottoEncoder : Motto -> Encode.Value
mottoEncoder motto =
    let
        attributes =
            [ ( "id", Encode.string motto.id )
            , ( "text", Encode.string motto.text )
            ]
    in
    Encode.object attributes



-- ON LOCATION CHANGE


onLocationChangeCommand : Model -> Route -> Cmd Msg
onLocationChangeCommand model route =
    case route of
        Models.BrowseRoute ->
            fetchUserList model.apiUrl

        Models.AuthorRoute userId ->
            fetchUser model.apiUrl userId

        Models.EditMottoRoute ->
            fetchMotto model.apiUrl model.authorizedUser

        _ ->
            Cmd.none
