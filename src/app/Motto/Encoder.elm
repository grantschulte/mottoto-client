module Motto.Encoder exposing (..)

import Json.Encode as Encode
import Models exposing (AuthorizedUser, EditMottoForm, Motto)


-- EDIT MOTTO FORM ENCODER


mottoFormEncoder : EditMottoForm -> Encode.Value
mottoFormEncoder mottoForm =
    let
        attributes =
            [ ( "text", Encode.string mottoForm.text )
            ]
    in
    Encode.object attributes
