module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Views.Entry exposing (..)
import Views.Header exposing (..)
import Views.Motto exposing (..)
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
        AuthorRoute authorHandle ->
            Views.Motto.view model

        EntryRoute ->
            Views.Entry.view

        NotFoundRoute ->
            Views.NotFound.view

        SiteStatusRoute ->
            Views.SiteStatus.view model

        WelcomeRoute ->
            Views.Welcome.view
