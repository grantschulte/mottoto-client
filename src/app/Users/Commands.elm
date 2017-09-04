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
        , headers = []
        , method = "PUT"
        , timeout = Nothing
        , url = saveUserUrl apiUrl
        , withCredentials = False
        }



-- UPDATE USER URL


saveUserUrl : ApiUrl -> String
saveUserUrl apiUrl =
    apiUrl ++ "/api/users"
