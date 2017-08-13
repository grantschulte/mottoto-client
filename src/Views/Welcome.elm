module Views.Welcome exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- VIEW: WELCOME


view : Model -> Html Msg
view model =
    div [] [ text "Welcome" ]
