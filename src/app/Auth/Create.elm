module Auth.Create exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (loginPath)
import Utils.Errors exposing (errorElement)


-- VIEW: CREATE


view : Model -> Html Msg
view model =
    div
        [ id "create-page"
        , class "flex items-center justify-center max-width-4 mx-auto h100"
        , style [ ( "margin", "auto" ) ]
        ]
        [ div [ class "col-12 md-col-4 center m-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ]
                [ text "join" ]
            , errorElement model.createForm.error
            , div [ class "form my2" ]
                [ label
                    [ class "block left-align h5 mb1"
                    , for "create-email"
                    ]
                    [ text "email" ]
                , input
                    [ type_ "email"
                    , id "create-email"
                    , value model.createForm.email
                    , placeholder "abrahamlincoln@email.com"
                    , class "mb2"
                    , onInput (UpdateCreateForm "create-email")
                    ]
                    []
                , label
                    [ class "block left-align h5 mb1"
                    , for "create-handle"
                    ]
                    [ text "handle" ]
                , input
                    [ type_ "text"
                    , id "create-handle"
                    , value model.createForm.handle
                    , placeholder "HonestAbe"
                    , class "mb2"
                    , onInput (UpdateCreateForm "create-handle")
                    ]
                    []
                , label
                    [ class "block left-align h5 mb1"
                    , for "create-password"
                    ]
                    [ text "password" ]
                , input
                    [ type_ "password"
                    , id "create-password"
                    , value model.createForm.password
                    , placeholder "********"
                    , class "mb2"
                    , onInput (UpdateCreateForm "create-password")
                    ]
                    []
                ]
            , div []
                [ button
                    [ class "button button-large button-primary w100"
                    , onClick (CreateUser model.createForm)
                    ]
                    [ text "proceed" ]
                ]
            , p [ class "h4 regular mt3" ]
                [ text "Already have an account? "
                , a [ href loginPath ] [ text "login." ]
                ]
            ]
        ]
