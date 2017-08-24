module Users.Commands exposing (..)

import Commands exposing (mottoDecoder)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import Messages exposing (..)
import Models exposing (..)


-- UPDATE USER


saveUserCmd : Model -> EditUserForm -> Cmd Msg
saveUserCmd model userForm =
    saveUserRequest model.env.apiUrl userForm model.authorizedUser
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



-- USER DECODER


userDecoder : Decode.Decoder User
userDecoder =
    decode User
        |> required "id" Decode.string
        |> required "email" Decode.string
        |> required "handle" Decode.string
        |> required "motto" mottoDecoder



-- EDIT USER FORM ENCODER


userFormEncoder : EditUserForm -> Encode.Value
userFormEncoder userForm =
    let
        attributes =
            [ ( "email", Encode.string userForm.email )
            , ( "handle", Encode.string userForm.handle )
            ]
    in
    Encode.object attributes
