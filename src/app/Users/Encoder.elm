module Users.Encoder exposing (..)

import Json.Encode as Encode
import Models exposing (EditUserForm)


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
