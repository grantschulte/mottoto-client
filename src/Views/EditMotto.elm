module Views.EditMotto exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "user-motto-page"
        , class "flex items-center justify-center h100"
        ]
        [ page ]


page : Html Msg
page =
    div [ class "col-12 md-col-4 center m1-auto" ]
        [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "update motto" ]
        , div [ class "form my3" ]
            [ textarea [ rows 4 ] [ text "Nothing yet'" ]
            ]
        , div []
            [ button [ class "button button-large button-primary w100" ]
                [ text "update" ]
            ]
        ]
