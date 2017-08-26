module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Routing exposing (browsePath, editMottoPath, entryPath)


-- VIEW: WELCOME


view : Html Msg
view =
    div
        [ id "welcome-page"
        , class "flex items-center justify-center h100"
        ]
        [ div [ class "col-12 md-col-5 center" ]
            [ h1 [ class "mt0 mb2 oversized lh1" ] [ text "motto" ]
            , div [ class "m2" ]
                [ span [ class "dot" ] []
                ]
            , p [ class "mt0 mb1 h3 italic" ] [ text "noun" ]
            , p [ class "m0 h3" ] [ text "a short sentence or phrase chosen as encapsulating the beliefs or ideals guiding an individual, family, or institution." ]
            , div [ class "mt3" ]
                [ button [ class "button mx1 button-large button-primary", onClick (NavigateTo editMottoPath) ] [ text "compose" ]
                , button [ class "button mx1 button-large button-primary", onClick (NavigateTo browsePath) ] [ text "browse" ]
                ]
            ]
        ]
