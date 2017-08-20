module Views.MottoDetail exposing (..)

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
        [ id "author-motto-page"
        , class "flex items-center justify-center h100"
        ]
        [ page model.motto
        ]


page : WebData Motto -> Html Msg
page response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            Views.Loader.view

        RemoteData.Success motto ->
            mottoDisplay motto

        RemoteData.Failure error ->
            Views.Error.view error


mottoDisplay : Motto -> Html Msg
mottoDisplay motto =
    div [ class "col-12 md-col-6" ]
        [ h1 [ class "h1 regular" ] [ mottoText motto.text ]
        , p [ class "h2 mt3 right-align" ] [ mottoUser motto.userId ]
        ]


mottoUser : UserId -> Html Msg
mottoUser userId =
    text ("—" ++ toString userId)


mottoText : MottoText -> Html Msg
mottoText motto =
    text (String.Extra.decapitalize motto)
