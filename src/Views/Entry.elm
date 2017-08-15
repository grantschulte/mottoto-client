module Views.Entry exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


-- VIEW: ENTRY


view : Html Msg
view =
    div
        [ id "entry-page"
        , class "flex items-center justify-center height-full"
        ]
        [ div [ class "col-12 md-col-4 center m1-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "login or create" ]
            , div [ class "m2" ]
                [ label [ class "hide" ] [ text "handle" ]
                , input
                    [ type_ "text"
                    , placeholder "johnkennedy"
                    , class "block m0 width-full"
                    ]
                    []
                , label [ class "hide" ] [ text "password" ]
                , input
                    [ type_ "password"
                    , placeholder "********"
                    , class "block m0 width-full"
                    ]
                    []
                ]
            , div [ class "m2" ]
                [ a [] [ text "proceed" ] ]
            ]
        ]
