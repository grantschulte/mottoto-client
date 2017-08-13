module Views.SiteStatus exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (ApiUrl, Model, NodeEnv)


-- VIEW: SITE STATUS


view : Model -> Html Msg
view model =
    div [ class "site-status-page" ]
        [ Html.h3 [ class "mt0 flex items-center" ]
            [ span [ class "material-icons color-warn mr1" ]
                [ text "info_outline"
                ]
            , text "Mottoto Status"
            ]
        , infoText model.apiUrl model.nodeEnv
        ]


infoText : ApiUrl -> NodeEnv -> Html Msg
infoText apiUrl nodeEnv =
    p [ class "m0" ]
        [ text "Your are running in "
        , em [ class "underline" ]
            [ text nodeEnv
            ]
        , text " and the api url is "
        , em [ class "underline" ]
            [ text apiUrl
            ]
        ]
