module Users.Commands exposing (..)

import Http
import Messages exposing (..)
import Models exposing (..)
import Users.Decoder exposing (userDecoder)
import Users.Encoder exposing (userFormEncoder)


-- UPDATE USER


saveUserCmd : Model -> User -> EditUserForm -> Cmd Msg
saveUserCmd model user userForm =
    saveUserRequest model.env.apiUrl userForm user
        |> Http.send OnSaveUser



-- UPDATE USER REQUEST


saveUserRequest : ApiUrl -> EditUserForm -> User -> Http.Request User
saveUserRequest apiUrl userForm user =
    Http.request
        { body = userFormEncoder userForm |> Http.jsonBody
        , expect = Http.expectJson userDecoder
        , headers = [ Http.header "x-access-token" user.token ]
        , method = "PUT"
        , timeout = Nothing
        , url = saveUserUrl apiUrl
        , withCredentials = False
        }



-- UPDATE USER URL


saveUserUrl : ApiUrl -> String
saveUserUrl apiUrl =
    apiUrl ++ "/api/users"



-- DELETE USER


deleteUserCmd : Model -> User -> Cmd Msg
deleteUserCmd model user =
    deleteUserRequest model.env.apiUrl user
        |> Http.send OnDeleteUser



-- DELETE USER REQUEST


deleteUserRequest : ApiUrl -> User -> Http.Request User
deleteUserRequest apiUrl user =
    Http.request
        { body = Http.emptyBody
        , expect = Http.expectJson userDecoder
        , headers = [ Http.header "x-access-token" user.token ]
        , method = "DELETE"
        , timeout = Nothing
        , url = deleteUserUrl apiUrl user
        , withCredentials = False
        }



-- DELETE USER URL


deleteUserUrl : ApiUrl -> User -> String
deleteUserUrl apiUrl user =
    apiUrl ++ "/api/users"



-- GET USER FROM TOKEN


getUserFromTokenCmd : Model -> Token -> Cmd Msg
getUserFromTokenCmd model token =
    getUserFromTokenRequest model.env.apiUrl token
        |> Http.send OnGetUserFromToken



-- GET USER FROM TOKEN REQUEST


getUserFromTokenRequest : ApiUrl -> Token -> Http.Request User
getUserFromTokenRequest apiUrl token =
    Http.request
        { body = Http.emptyBody
        , expect = Http.expectJson userDecoder
        , headers = []
        , method = "GET"
        , timeout = Nothing
        , url = getUserFromTokenUrl apiUrl token
        , withCredentials = False
        }



-- GET USER FROM TOKEN URL


getUserFromTokenUrl : ApiUrl -> String -> String
getUserFromTokenUrl apiUrl token =
    apiUrl ++ "/auth/me/from/token?token=" ++ token
