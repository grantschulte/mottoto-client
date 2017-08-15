module Views.Loader exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)


view : Html Msg
view =
    div
        [ id "loader-element"
        , class "flex justify-center items-center"
        ]
        [ div [ class "loader" ]
            [ text "Loading..."
            ]
        ]
