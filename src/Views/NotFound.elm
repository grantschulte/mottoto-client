module Views.NotFound exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- VIEW: NOT FOUND


view : Html msg
view =
    div
        [ id "not-found-page"
        , class "flex items-center justify-center height-full"
        ]
        [ div [ class "max-width-2 center" ]
            [ div [ class "mb3" ]
                [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "not found" ]
                , div [ class "m2" ]
                    [ span [ class "dot" ] []
                    ]
                , p [ class "m0 h3" ] [ text "We peered into your future" ]
                , p [ class "m0 h3" ] [ text "There's nothing where you're bound" ]
                , p [ class "m0 h3" ] [ text "So we present this query" ]
                , p [ class "m0 h3" ] [ text "Can nothing be not found?" ]
                , div [ class "m2" ]
                    [ span [ class "dot" ] []
                    ]
                , div [ class "h3" ]
                    [ a [ href "#/" ] [ text "return home" ] ]
                ]
            ]
        ]
