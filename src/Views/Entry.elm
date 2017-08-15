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
        , class "flex items-center justify-center h100"
        ]
        [ div [ class "col-12 md-col-4 center m1-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "login or create" ]
            , div [ class "form" ]
                [ label [ class "hide" ] [ text "handle" ]
                , input
                    [ type_ "text"
                    , placeholder "johnkennedy"
                    , class "mb1"
                    ]
                    []
                , label [ class "hide" ] [ text "password" ]
                , input
                    [ type_ "password"
                    , placeholder "********"
                    , class ""
                    ]
                    []
                ]
            , div [ class "mt2" ]
                [ button [ class "button button-large button-primary w100" ]
                    [ text "proceed" ]
                ]
            ]
        ]
