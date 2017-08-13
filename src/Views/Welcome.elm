module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


-- VIEW: WELCOME


view : Html Msg
view =
    div [ class "welcome-page flex items-center justify-center" ]
        [ div [ class "center" ]
            [ h1 [ class "mt0" ]
                [ text "mottoto"
                ]
            , div [ class "m0" ]
                [ button [ class "button button-primary button-large mx1" ] [ text "login" ]
                , button [ class "button button-primary button-large mx1" ] [ text "browse" ]
                ]
            ]
        ]
