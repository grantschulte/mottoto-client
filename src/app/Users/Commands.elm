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
