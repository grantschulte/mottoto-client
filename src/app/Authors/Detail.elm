module Authors.Detail exposing (..)

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
        , class "sm-flex items-center justify-center h100"
        ]
        [ page model.author
        ]


page : WebData Author -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            Views.Loader.view

        RemoteData.Success author ->
            mottoDisplay author

        RemoteData.Failure error ->
            Views.Error.view error


mottoDisplay : Author -> Html Msg
mottoDisplay author =
    div [ class "col-12 md-col-6" ]
        [ h1 [ class "h1 regular" ] [ text (formatMottoText author.motto.text) ]
        , p [ class "h2 mt3 right-align" ] [ text (formatHandle author.handle) ]
        ]
