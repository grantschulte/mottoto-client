module Users.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "edit-profile-page"
        , class "flex items-center justify-center h100"
        ]
        [ page model ]


page : Model -> Html Msg
page model =
    case model.authorizedUser of
        Nothing ->
            div [] []

        Just user ->
            authorizedPage model user


authorizedPage : Model -> AuthorizedUser -> Html Msg
authorizedPage model user =
    div [ class "col-12 md-col-4 center m1-auto" ]
        [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "edit profile" ]
        , div [ class "form my3" ]
            [ label [ class "block left-align h5 mb1" ]
                [ text "handle" ]
            , input
                [ type_ "text"
                , class "mb2"
                , onInput (UpdateUser "handle")
                , placeholder user.handle
                ]
                []
            , label [ class "block left-align h5 mb1" ]
                [ text "email address" ]
            , input
                [ type_ "email"
                , class "mb2"
                , placeholder user.email
                , onInput (UpdateUser "email")
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
