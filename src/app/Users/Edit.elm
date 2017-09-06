module Users.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)
import Utils.Errors exposing (..)


view : Model -> User -> Html Msg
view model user =
    div
        [ id "edit-profile-page"
        , class "flex items-center justify-center max-width-4 mx-auto h100"
        ]
        [ div [ class "col-12 md-col-4 center m1-auto" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "edit profile" ]
            , errorElement model.editUserForm.error
            , div [ class "form my3" ]
                [ label [ class "block left-align h5 mb1" ]
                    [ text "handle" ]
                , input
                    [ type_ "text"
                    , class "mb2"
                    , onInput (UpdateUserForm "handle")
                    , value model.editUserForm.handle
                    ]
                    []
                , label [ class "block left-align h5 mb1" ]
                    [ text "email address" ]
                , input
                    [ type_ "email"
                    , class "mb2"
                    , value model.editUserForm.email
                    , onInput (UpdateUserForm "email")
                    ]
                    []
                , label [ class "block left-align h5 mb1" ]
                    [ text "password" ]
                , input
                    [ type_ "password"
                    , class "mb2"
                    , placeholder "********"
                    , onInput (UpdateUserForm "password")
                    ]
                    []
                ]
            , div []
                [ button
                    [ class "button button-large button-primary w100"
                    , onClick (SaveUser model.editUserForm)
                    ]
                    [ text "update" ]
                ]
            ]
        ]
