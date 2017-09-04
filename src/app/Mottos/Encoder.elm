module Mottos.Encoder exposing (..)

import Json.Encode as Encode
import Models exposing (EditMottoForm)


-- EDIT MOTTO FORM ENCODER


mottoFormEncoder : EditMottoForm -> Encode.Value
mottoFormEncoder mottoForm =
    let
        attributes =
            [ ( "text", Encode.string mottoForm.text )
            ]
    in
    Encode.object attributes
