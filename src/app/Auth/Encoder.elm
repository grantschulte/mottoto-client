module Auth.Encoder exposing (..)

import Json.Encode as Encode
import Models exposing (LoginUserForm)


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
