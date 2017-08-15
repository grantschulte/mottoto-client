module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (welcomePath)


view : Model -> Html Msg
view model =
    header [ class "flex justify-center items-center fixed block w100 p2" ]
        [ a
            [ href welcomePath
            , class "h1 bold flex-auto text-decoration-none lh1"
            ]
            [ text "mottoto" ]
        , div [ class "right-align" ]
            [ span [ class "inline-block material-icons p1 header-icon" ] [ text "search" ]
            , span [ class "inline-block material-icons p1 header-icon ml1" ] [ text "create" ]
            ]
        ]
