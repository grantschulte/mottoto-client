module Views.Motto exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (WebData)
import String.Extra exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "author-motto-page"
        , class "flex items-center justify-center h100"
        ]
        [ page model.author
        ]


page : WebData Author -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success author ->
            motto author

        RemoteData.Failure error ->
            text (toString error)


motto : Author -> Html Msg
motto author =
    div [ class "col-12 md-col-8" ]
        [ h1 [ class "font-big regular" ] [ mottoText author.motto ]
        , p [ class "h3 right-align" ] [ authorText author.handle ]
        ]


authorText : AuthorHandle -> Html Msg
authorText handle =
    text ("—" ++ handle)


mottoText : AuthorMotto -> Html Msg
mottoText motto =
    text (String.Extra.decapitalize motto)
