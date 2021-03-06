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
            , h1 [ class "h2 m0" ] [ text "mottoto status" ]
            ]
        , infoText model.env.apiUrl model.env.nodeEnv
        ]


infoText : ApiUrl -> NodeEnv -> Html Msg
infoText apiUrl nodeEnv =
    p [ class "m0" ]
        [ text "Your are running a "
        , em [ class "underline" ]
            [ text nodeEnv
            ]
        , text " environment and the api url is "
        , em [ class "underline" ]
            [ text apiUrl
            ]
        ]
