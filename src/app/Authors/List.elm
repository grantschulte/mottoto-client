module Authors.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (authorPath)
import Utils.FormatText exposing (..)
import Views.Error exposing (..)
import Views.Loader exposing (..)


view : WebData (List Author) -> Html Msg
view authors =
    div
        [ id "browse-page"
        , class "pt4"
        ]
        [ page authors
        ]


page : WebData (List Author) -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            Views.Loader.view

        RemoteData.Success authors ->
            mottoList authors

        RemoteData.Failure error ->
            Views.Error.view error


mottoList : List Author -> Html Msg
mottoList authors =
    div [ class "flex flex-wrap mxn2" ] (filterMottos authors)


mottoColumn : Author -> Html Msg
mottoColumn author =
    div [ class "col-12 sm-col-6 md-col-4 px2 mb3 flex" ]
        [ a
            [ href (authorPath author.handle)
            , class "block p2 text-decoration-none border-top w100"
            ]
            [ h3 [ class "h3 m0" ] [ text (formatMottoText author.motto.text) ]
            , div [ class "mt2 right-align h4" ] [ text (formatHandle author.handle) ]
            ]
        ]


filterMottos : List Author -> List (Html Msg)
filterMottos authors =
    authors
        |> List.filter hasText
        |> List.map mottoColumn


hasText : Author -> Bool
hasText author =
    not (String.isEmpty author.motto.text)
