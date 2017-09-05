module Auth.Commands exposing (..)

import Auth.Encoder exposing (loginFormEncoder)
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
