module Views.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (createPath, editMottoPath, editUserPath, loginPath, welcomePath)


view : Model -> Html Msg
view model =
    header [ class "flex justify-center items-center fixed top-0 right-0 left-0 p2" ]
        [ a
            [ href welcomePath
            , class "h1 bold flex-auto text-decoration-none lh1"
            ]
            [ text "mottoto" ]
        , userActions model.user
        ]


userActions : Maybe User -> Html Msg
userActions user =
    case user of
        Nothing ->
            loggedOutActions

        Just user ->
            loggedInActions


editMottoOrLoginHref : Maybe User -> String
editMottoOrLoginHref user =
    case user of
        Nothing ->
            loginPath

        Just user ->
            editMottoPath


editUserOrLoginHref : Maybe User -> String
editUserOrLoginHref user =
    case user of
        Nothing ->
            loginPath

        Just user ->
            editMottoPath


loggedOutActions : Html Msg
loggedOutActions =
    div []
        [ a
            [ href loginPath
            , class "inline-block ml2 text-decoration-none"
            ]
            [ text "login" ]
        , a
            [ href createPath
            , class "inline-block ml2 text-decoration-none"
            ]
            [ text "join" ]
        ]


loggedInActions : Html Msg
loggedInActions =
    div []
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
