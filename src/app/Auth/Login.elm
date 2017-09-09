module Auth.Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (createPath)
import Utils.Errors exposing (errorElement)


-- VIEW: LOGIN


view : Model -> Html Msg
view model =
    div
        [ id "login-page"
        , class "sm-flex items-center justify-center max-width-4 mx-auto h100"
        ]
        [ div [ class "col-12 md-col-4 center mx-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "login" ]
            , errorElement model.loginForm.error
            , div [ class "form my2" ]
                [ label
                    [ class "block left-align h5 mb1"
                    , for "login-email"
                    ]
                    [ text "email" ]
                , input
                    [ type_ "email"
                    , id "login-email"
                    , value model.loginForm.email
                    , placeholder "abrahamlincoln@email.com"
                    , class "mb2"
                    , onInput (UpdateLoginForm "login-email")
                    ]
                    []
                , label
                    [ class "block left-align h5 mb1"
                    , for "login-password"
                    ]
                    [ text "password" ]
                , input
                    [ type_ "password"
                    , id "login-password"
                    , placeholder "********"
                    , value model.loginForm.password
                    , class "mb2"
                    , onInput (UpdateLoginForm "login-password")
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
