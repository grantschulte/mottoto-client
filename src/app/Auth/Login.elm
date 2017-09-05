module Auth.Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (createPath)


-- VIEW: ENTRY


view : Model -> Html Msg
view model =
    div
        [ id "login-page"
        , class "flex items-center justify-center max-width-4 mx-auto h100"
        ]
        [ div [ class "col-12 md-col-4 center m1-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "login" ]
            , div [ class "form my2" ]
                [ label [ class "block left-align h5 mb1" ]
                    [ text "email" ]
                , input
                    [ type_ "email"
                    , placeholder "abrahamlincoln@gmail.com"
                    , class "mb2"
                    , onInput (UpdateLoginForm "email")
                    ]
                    []
                , label [ class "block left-align h5 mb1" ]
                    [ text "password" ]
                , input
                    [ type_ "password"
                    , placeholder "********"
                    , class "mb2"
                    , onInput (UpdateLoginForm "password")
                    ]
                    []
                ]
            , div []
                [ button
                    [ class "button button-large button-primary w100"
                    , onClick (LoginUser model.loginForm)
                    ]
                    [ text "proceed" ]
                ]
            , p [ class "h4 regular mt3" ]
                [ text "don't have an account? "
                , a [ href createPath ] [ text "create one." ]
                ]
            ]
        ]
