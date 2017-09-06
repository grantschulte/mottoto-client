module Auth.Commands exposing (..)

import Auth.Encoder exposing (createFormEncoder, loginFormEncoder)
import Http
import Json.Decode as Decode
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Users.Decoder exposing (userDecoder)


-- LOGIN USER


loginUserCmd : Model -> LoginUserForm -> Cmd Msg
loginUserCmd model userForm =
    loginUserRequest model.env.apiUrl userForm
        |> Http.send OnLoginUser



-- LOGIN USER REQUEST


loginUserRequest : ApiUrl -> LoginUserForm -> Http.Request User
loginUserRequest apiUrl loginForm =
    Http.request
        { body = loginFormEncoder loginForm |> Http.jsonBody
        , expect = Http.expectJson userDecoder
        , headers = []
        , method = "POST"
        , timeout = Nothing
        , url = loginUserUrl apiUrl
        , withCredentials = False
        }



-- LOGIN USER URL


loginUserUrl : ApiUrl -> String
loginUserUrl apiUrl =
    apiUrl ++ "/auth/login"



-- CREATE USER


createUserCmd : Model -> CreateUserForm -> Cmd Msg
createUserCmd model createForm =
    createUserRequest model.env.apiUrl createForm
        |> Http.send OnCreateUser



-- CREATE USER REQUEST


createUserRequest : ApiUrl -> CreateUserForm -> Http.Request User
createUserRequest apiUrl createForm =
    Http.request
        { body = createFormEncoder createForm |> Http.jsonBody
        , expect = Http.expectJson userDecoder
        , headers = []
        , method = "POST"
        , timeout = Nothing
        , url = createUserUrl apiUrl
        , withCredentials = False
        }



-- CREATE USER URL


createUserUrl : ApiUrl -> String
createUserUrl apiUrl =
    apiUrl ++ "/auth/create"
