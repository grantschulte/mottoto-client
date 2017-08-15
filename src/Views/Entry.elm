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
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "enter" ]
            , div [ class "dot" ] []
            , p [ class "my2 h3" ] [ text "enter your handle and password. if you don't have one we'll create it." ]
            , div [ class "form my3" ]
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
            , div []
                [ button [ class "button button-large button-primary w100" ]
                    [ text "proceed" ]
                ]
            ]
        ]
