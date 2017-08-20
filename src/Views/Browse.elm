module Views.Browse exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (authorPath)
import Utils.FormatText exposing (..)
import Views.Error exposing (..)
import Views.Loader exposing (..)


view : WebData (List User) -> Html Msg
view users =
    div
        [ id "motto-detail-page"
        , class "pt4"
        ]
        [ page users
        ]


page : WebData (List User) -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            Views.Loader.view

        RemoteData.Success users ->
            mottoList users

        RemoteData.Failure error ->
            Views.Error.view error


mottoList : List User -> Html Msg
mottoList users =
    div [ class "flex flex-wrap mxn2" ] (List.map mottoColumn users)


mottoColumn : User -> Html Msg
mottoColumn user =
    div [ class "col-12 sm-col-12 md-col-6 lg-col-4 px2 mb3 flex" ]
        [ a
            [ href (authorPath user.id)
            , class "block p2 text-decoration-none border-top w100"
            ]
            [ h3 [ class "h3 m0" ] [ text (formatMottoText user.motto.text) ]
            , div [ class "mt2 right-align h4" ] [ text (formatUserHandle user.handle) ]
            ]
        ]
