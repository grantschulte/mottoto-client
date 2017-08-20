module Views.Author exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (WebData)
import String.Extra exposing (..)
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
            userDisplay user

        RemoteData.Failure error ->
            Views.Error.view error


userDisplay : User -> Html Msg
userDisplay user =
    div [ class "col-12 md-col-6" ]
        [ h1 [ class "h1 regular" ] [ mottoText user.motto ]
        , p [ class "h2 mt3 right-align" ] [ mottoUser user.handle ]
        ]


mottoUser : UserHandle -> Html Msg
mottoUser userHandle =
    text ("— " ++ String.Extra.decapitalize userHandle)


mottoText : Motto -> Html Msg
mottoText motto =
    text (String.Extra.decapitalize motto.text)
