module Views.MottoList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (mottoDetailPath)
import Views.Error exposing (..)
import Views.Loader exposing (..)


view : WebData (List Motto) -> Html Msg
view mottos =
    div
        [ id "motto-detail-page"
        , class "flex items-center justify-center h100"
        ]
        [ div [ class "flex flex-wrap w100 mxn2" ]
            [ page mottos ]
        ]


page : WebData (List Motto) -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            Views.Loader.view

        RemoteData.Success mottos ->
            mottoList mottos

        RemoteData.Failure error ->
            Views.Error.view error


mottoList : List Motto -> Html Msg
mottoList mottos =
    div [] (List.map mottoColumn mottos)


mottoColumn : Motto -> Html Msg
mottoColumn motto =
    a
        [ href (mottoDetailPath motto.id)
        , class "col-12 sm-col-12 md-col-4 p2 border-bottom text-decoration-none"
        ]
        [ h3 [ class "h3 m0" ] [ text motto.text ]
        , div [ class "mt2 right-align h4" ] [ text (toString motto.userId) ]
        ]
