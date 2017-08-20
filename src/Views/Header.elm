module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (editMottoPath, editProfilePath, entryPath, welcomePath)


view : Model -> Html Msg
view model =
    header [ class "flex justify-center items-center fixed block w100 p2" ]
        [ a
            [ href welcomePath
            , class "h1 bold flex-auto text-decoration-none lh1"
            ]
            [ text "mottoto" ]
        , div [ class "right-align" ]
            [ a
                [ href (editMottoOrLoginHref model.authorizedUser)
                , class "inline-block material-icons p1 header-icon ml1"
                ]
                [ text "create" ]
            , a
                [ href (editUserOrLoginHref model.authorizedUser)
                , class "inline-block material-icons p1 header-icon ml1"
                ]
                [ text "person" ]
            ]
        ]


editMottoOrLoginHref : AuthorizedUser -> String
editMottoOrLoginHref user =
    if String.isEmpty user.token then
        entryPath
    else
        editMottoPath


editUserOrLoginHref : AuthorizedUser -> String
editUserOrLoginHref user =
    if String.isEmpty user.token then
        entryPath
    else
        editProfilePath
