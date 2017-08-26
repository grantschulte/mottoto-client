module Users.Commands exposing (..)

-- import Json.Decode.Pipeline exposing (decode, required)
-- import Json.Encode as Encode

import Http
import Json.Decode as Decode
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Users.Decoder exposing (userDecoder)
import Users.Encoder exposing (userFormEncoder)


-- FETCH USER


fetchUser : ApiUrl -> UserId -> Cmd Msg
fetchUser apiUrl userId =
    Http.get (fetchUserUrl apiUrl userId) userDecoder
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchUser


fetchUserUrl : ApiUrl -> UserId -> String
fetchUserUrl apiUrl userId =
    apiUrl ++ "/users/" ++ userId ++ "?_expand=motto"



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



-- UPDATE USER


saveUserCmd : Model -> AuthorizedUser -> EditUserForm -> Cmd Msg
saveUserCmd model user userForm =
    saveUserRequest model.env.apiUrl userForm user
        |> Http.send OnSaveUser



-- UPDATE USER REQUEST


saveUserRequest : ApiUrl -> EditUserForm -> AuthorizedUser -> Http.Request User
saveUserRequest apiUrl userForm authorizedUser =
    Http.request
        { body = userFormEncoder userForm |> Http.jsonBody
        , expect = Http.expectJson userDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveUserUrl apiUrl authorizedUser.id
        , withCredentials = False
        }



-- UPDATE USER URL


saveUserUrl : ApiUrl -> UserId -> String
saveUserUrl apiUrl userId =
    apiUrl ++ "/users/" ++ userId
