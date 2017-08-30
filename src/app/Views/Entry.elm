module Views.Entry exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)


-- VIEW: ENTRY


view : Model -> Html Msg
view model =
    div
        [ id "entry-page"
        , class "flex items-center justify-center h100"
        ]
        [ div [ class "col-12 md-col-4 center m1-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "enter" ]
            , div [ class "dot" ] []
            , p [ class "my2 h3" ] [ text "enter your handle and password. if you don't have an account, we'll create it." ]
            , div [ class "form my3" ]
                [ label [ class "block left-align h5 mb1" ]
                    [ text "email" ]
                , input
                    [ type_ "email"
                    , placeholder "abrahamlincoln@gmail.com"
                    , class "mb2"
                    , onInput (UpdateEntryForm "email")
                    ]
                    []
                , label [ class "block left-align h5 mb1" ]
                    [ text "password" ]
                , input
                    [ type_ "password"
                    , placeholder "********"
                    , class "mb2"
                    , onInput (UpdateEntryForm "password")
                    ]
                    []
                ]
            , div []
                [ button
                    [ class "button button-large button-primary w100"
                    , onClick (Login model.entryForm)
                    ]
                    [ text "proceed" ]
                ]
            ]
        ]
