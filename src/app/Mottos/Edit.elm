module Mottos.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (..)
import Utils.Errors exposing (errorElement)


view : Model -> User -> Html Msg
view model user =
    div
        [ id "edit-motto-page"
        , class "flex items-center justify-center max-width-4 mx-auto h100"
        ]
        [ page model user ]


page : Model -> User -> Html Msg
page model user =
    div [ class "col-12 md-col-4 center m1-auto" ]
        [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "what's your motto?" ]
        , errorElement model.createForm.error
        , div [ class "form my3" ]
            [ textarea
                [ rows 4
                , onInput UpdateMottoForm
                , placeholder "Express yourself..."
                ]
                [ text user.motto.text ]
            ]
        , div []
            [ button
                [ onClick (SaveMotto model.editMottoForm)
                , class "button button-large button-primary w100"
                ]
                [ text "publish" ]
            ]
        ]
