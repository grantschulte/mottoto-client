module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (entryPath, userEditPath, userMottoPath, welcomePath)


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
                [ href (createOrLoginHref model.user)
                , class "inline-block material-icons p1 header-icon ml1"
                ]
                [ text "create" ]
            , a
                [ href (editOrLoginHref model.user)
                , class "inline-block material-icons p1 header-icon ml1"
                ]
                [ text "person" ]
            ]
        ]


createOrLoginHref : User -> String
createOrLoginHref user =
    if String.isEmpty user.token then
        userMottoPath user.handle
    else
        entryPath


editOrLoginHref : User -> String
editOrLoginHref user =
    if String.isEmpty user.token then
        userEditPath user.handle
    else
        entryPath
