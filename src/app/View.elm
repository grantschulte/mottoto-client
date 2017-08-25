module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import String exposing (isEmpty)
import Users.Edit exposing (..)
import Views.Author exposing (..)
import Views.Browse exposing (..)
import Views.EditMotto exposing (..)
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
        AuthorRoute userId ->
            Views.Author.view model

        BrowseRoute ->
            Views.Browse.view model.users

        EditUserRoute ->
            let
                user =
                    model.authorizedUser

                editUserView =
                    Users.Edit.view model
            in
            isAuthorized user editUserView

        EditMottoRoute ->
            let
                user =
                    model.authorizedUser

                editMottoView =
                    Views.EditMotto.view model
            in
            isAuthorized user editMottoView

        EntryRoute ->
            Views.Entry.view

        NotFoundRoute ->
            Views.NotFound.view

        SiteStatusRoute ->
            Views.SiteStatus.view model

        WelcomeRoute ->
            Views.Welcome.view


isAuthorized : Maybe AuthorizedUser -> Html Msg -> Html Msg
isAuthorized user authorizedView =
    case user of
        Nothing ->
            Views.Entry.view

        Just user ->
            authorizedView
