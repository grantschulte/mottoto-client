module Views.EditProfile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "edit-profile-page"
        , class "flex items-center justify-center h100"
        ]
        [ page model.authorizedUser ]


page : AuthorizedUser -> Html Msg
page user =
    div [ class "col-12 md-col-4 center m1-auto" ]
        [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "edit profile" ]
        , div [ class "form my3" ]
            [ label [ class "block left-align h5 mb1" ]
                [ text "handle" ]
            , input [ type_ "text", class "mb2", placeholder user.handle ] []
            , label [ class "block left-align h5 mb1" ]
                [ text "email address" ]
            , input [ type_ "email", class "mb2", placeholder user.email ] []
            , label [ class "block left-align h5 mb1" ]
                [ text "password" ]
            , input [ type_ "password", class "mb2", placeholder "********" ] []
            ]
        , div []
            [ button [ class "button button-large button-primary w100" ]
                [ text "update" ]
            ]
        ]
