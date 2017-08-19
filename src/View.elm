module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Views.Entry exposing (..)
import Views.Header exposing (..)
import Views.MottoDetail exposing (..)
import Views.MottoList exposing (..)
import Views.NotFound exposing (..)
import Views.SiteStatus exposing (..)
import Views.UserEditMotto exposing (..)
import Views.UserEditProfile exposing (..)
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
        EntryRoute ->
            Views.Entry.view

        MottoDetailRoute authorHandle ->
            Views.MottoDetail.view model

        MottoListRoute ->
            Views.MottoList.view model

        NotFoundRoute ->
            Views.NotFound.view

        SiteStatusRoute ->
            Views.SiteStatus.view model

        UserEditProfileRoute userHandle ->
            Views.UserEditProfile.view model

        UserEditMottoRoute userHandle ->
            Views.UserEditMotto.view model

        WelcomeRoute ->
            Views.Welcome.view
