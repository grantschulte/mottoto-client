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
        ]
        [ div [ class "col-12 md-col-4 center m1-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ]
                [ text "join" ]
            , errorElement model.createForm.error
            , div [ class "form my2" ]
                [ label [ class "block left-align h5 mb1" ]
                    [ text "email" ]
                , input
                    [ type_ "email"
                    , placeholder "abrahamlincoln@gmail.com"
                    , class "mb2"
                    , onInput (UpdateCreateForm "email")
                    ]
                    []
                , label [ class "block left-align h5 mb1" ]
                    [ text "handle" ]
                , input
                    [ type_ "text"
                    , placeholder "abeLincoln"
                    , class "mb2"
                    , onInput (UpdateCreateForm "handle")
                    ]
                    []
                , label [ class "block left-align h5 mb1" ]
                    [ text "password" ]
                , input
                    [ type_ "password"
                    , placeholder "********"
                    , class "mb2"
                    , onInput (UpdateCreateForm "password")
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
