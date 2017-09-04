module View exposing (..)

import Authors.Detail exposing (..)
import Authors.List exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Mottos.Edit exposing (..)
import Users.Edit exposing (..)
import Views.Entry exposing (..)
import Views.Header exposing (..)
import Views.NotFound exposing (..)
import Views.SiteStatus exposing (..)
import Views.Welcome exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div [ class "site-wrapper" ]
        [ header model
        , div [ class "page-wrapper p2 h100" ]
            [ page model
            ]
        ]



-- HEADER


header : Model -> Html Msg
header model =
    case model.route of
        SiteStatusRoute ->
            text ""

        _ ->
            Views.Header.view model



-- PAGE


page : Model -> Html Msg
page model =
    case model.route of
        AuthorsDetailRoute userHandle ->
            Authors.Detail.view model

        AuthorsIndexRoute ->
            Authors.List.view model.authors

        EditUserRoute ->
            case model.user of
                Nothing ->
                    Views.Entry.view model

                Just user ->
                    Users.Edit.view model user

        EditMottoRoute ->
            case model.user of
                Nothing ->
                    Views.Entry.view model

                Just user ->
                    Mottos.Edit.view model user

        EntryRoute ->
            Views.Entry.view model

        NotFoundRoute ->
            Views.NotFound.view

        SiteStatusRoute ->
            Views.SiteStatus.view model

        WelcomeRoute ->
            Views.Welcome.view
