module Views.Author exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (WebData)
import Utils.FormatText exposing (..)
import Views.Error exposing (..)
import Views.Loader exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "user-page"
        , class "flex items-center justify-center h100"
        ]
        [ page model.user
        ]


page : WebData User -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            Views.Loader.view

        RemoteData.Success user ->
            mottoDisplay user

        RemoteData.Failure error ->
            Views.Error.view error


mottoDisplay : User -> Html Msg
mottoDisplay user =
    div [ class "col-12 md-col-6" ]
        [ h1 [ class "h1 regular" ] [ text (formatMottoText user.motto.text) ]
        , p [ class "h2 mt3 right-align" ] [ text (formatUserHandle user.handle) ]
        ]
