module Views.NotFound exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Routing exposing (welcomeRoute)


-- VIEW: NOT FOUND


view : Html Msg
view =
    div
        [ id "not-found-page"
        , class "flex items-center justify-center height-full"
        ]
        [ div [ class "col-12 md-col-5 center" ]
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
                [ a [ href welcomeRoute ] [ text "return home" ] ]
            ]
        ]
