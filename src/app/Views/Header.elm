module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (editMottoPath, editUserPath, entryPath, welcomePath)


view : Model -> Html Msg
view model =
    header [ class "flex justify-center items-center fixed top-0 right-0 left-0 p2" ]
        [ a
            [ href welcomePath
            , class "h1 bold flex-auto text-decoration-none lh1"
            ]
            [ text "mottoto" ]
        , div []
            [ a
                [ href editMottoPath
                , class "inline-block material-icons p1 header-icon ml1"
                ]
                [ text "create" ]
            , a
                [ href editUserPath
                , class "inline-block material-icons p1 header-icon ml1"
                ]
                [ text "person" ]
            ]
        ]


editMottoOrLoginHref : Maybe AuthorizedUser -> String
editMottoOrLoginHref user =
    case user of
        Nothing ->
            entryPath

        Just user ->
            editMottoPath


editUserOrLoginHref : Maybe AuthorizedUser -> String
editUserOrLoginHref user =
    case user of
        Nothing ->
            entryPath

        Just user ->
            editMottoPath
