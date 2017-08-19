module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Routing exposing (entryPath, mottosPath, userEditMottoPath)


-- VIEW: WELCOME


view : Html Msg
view =
    div
        [ id "welcome-page"
        , class "flex items-center justify-center h100"
        ]
        [ div [ class "col-12 md-col-5 center" ]
            [ h1 [ class "mt0 mb2 h1 lh1" ] [ text "motto" ]
            , div [ class "m2" ]
                [ span [ class "dot" ] []
                ]
            , p [ class "mt0 mb1 h3 italic" ] [ text "noun" ]
            , p [ class "m0 h3" ] [ text "a short sentence or phrase chosen as encapsulating the beliefs or ideals guiding an individual, family, or institution." ]
            , div [ class "m2" ]
                [ span [ class "dot" ] []
                ]
            , p [ class "h3" ]
                [ a [ href entryPath ] [ text "compose" ]
                , text " a motto or "
                , a [ href mottosPath ] [ text "browse" ]
                , text "."
                ]
            ]
        ]
