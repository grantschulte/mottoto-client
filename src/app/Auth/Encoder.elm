module Auth.Encoder exposing (..)

import Json.Encode as Encode
import Models exposing (CreateUserForm, LoginUserForm)


-- LOGIN FORM ENCODER


loginFormEncoder : LoginUserForm -> Encode.Value
loginFormEncoder loginForm =
    let
        attributes =
            [ ( "email", Encode.string loginForm.email )
            , ( "password", Encode.string loginForm.password )
            ]
    in
    Encode.object attributes



-- CREATE FORM ENCODER


createFormEncoder : CreateUserForm -> Encode.Value
createFormEncoder createForm =
    let
        attributes =
            [ ( "email", Encode.string createForm.email )
            , ( "handle", Encode.string createForm.handle )
            , ( "password", Encode.string createForm.password )
            ]
    in
    Encode.object attributes
