module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Views.SiteStatus exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    Views.SiteStatus.view model
