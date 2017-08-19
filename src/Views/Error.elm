module Views.Error exposing (..)

import Html exposing (..)
import Http exposing (..)
import Messages exposing (..)


view : Http.Error -> Html Msg
view error =
    div [] [ text (toString error) ]
