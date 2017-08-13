module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Views.NotFound exposing (..)
import Views.SiteStatus exposing (..)
import Views.Welcome exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div [ class "site-wrapper" ]
        [ div [ class "page-wrapper" ]
            [ page model
            ]
        ]



-- PAGE


page : Model -> Html Msg
page model =
    case model.route of
        WelcomeRoute ->
            Views.Welcome.view

        SiteStatusRoute ->
            Views.SiteStatus.view model

        NotFoundRoute ->
            Views.NotFound.view
