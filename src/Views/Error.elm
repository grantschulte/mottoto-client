module Views.Error exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Http.Error -> Html Msg
view error =
    div [] [ text (toString error) ]
