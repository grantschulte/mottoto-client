module View exposing (..)

import Authors.Motto exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Views.Entry exposing (..)
import Views.NotFound exposing (..)
import Views.SiteStatus exposing (..)
import Views.Welcome exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div [ class "site-wrapper" ]
        [ div [ class "page-wrapper p2 h100" ]
            [ page model
            ]
        ]



-- PAGE


page : Model -> Html Msg
page model =
    case model.route of
        AuthorRoute authorId ->
            Authors.Motto.view model authorId

        EntryRoute ->
            Views.Entry.view

        NotFoundRoute ->
            Views.NotFound.view

        SiteStatusRoute ->
            Views.SiteStatus.view model

        WelcomeRoute ->
            Views.Welcome.view
