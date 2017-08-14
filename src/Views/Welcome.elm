module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


-- VIEW: WELCOME


view : Html Msg
view =
    div [ class "welcome-page flex items-center justify-center" ]
        [ div [ class "max-width-2 center" ]
            [ div [ class "mb3" ]
                [ h1 [ class "mt0 mb2 h1" ] [ text "mottoto" ]
                , div [ class "m2" ]
                    [ span [ class "dot" ] []
                    ]
                , p [ class "mt0 mb1 h3 italic" ] [ text "noun" ]
                , p [ class "m0 h3" ] [ text "a short sentence or phrase chosen as encapsulating the beliefs or ideals guiding an individual, family, or institution." ]
                ]
            , div [ class "m0" ]
                [ p [ class "h3" ]
                    [ span [ class "underline" ] [ text "compose" ]
                    , text " a motto "
                    , span [ class "underline" ] [ text "or explore." ]
                    ]
                ]
            ]
        ]
