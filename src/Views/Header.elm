module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (entryPath, userEditMottoPath, userEditProfilePath, welcomePath)


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
                [ href (mottoOrLoginHref model.user)
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


mottoOrLoginHref : User -> String
mottoOrLoginHref user =
    if String.isEmpty user.token then
        entryPath
    else
        userEditMottoPath user.handle


editOrLoginHref : User -> String
editOrLoginHref user =
    if String.isEmpty user.token then
        entryPath
    else
        userEditProfilePath user.handle
