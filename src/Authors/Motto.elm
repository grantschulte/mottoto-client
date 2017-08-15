module Authors.Motto exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import String.Extra exposing (..)


view : Model -> AuthorHandle -> Html Msg
view model authorHandle =
    div
        [ id "author-motto-page"
        , class "flex items-center justify-center h100"
        ]
        [ div [ class "col-12 md-col-8" ]
            [ h1 [ class "motto--text" ] [ mottoText model.author.motto ]
            , p [ class "motto--handle h3 right-align" ] [ authorText model.author.handle ]
            ]
        ]


authorText : AuthorHandle -> Html Msg
authorText handle =
    text ("—" ++ handle)


mottoText : AuthorMotto -> Html Msg
mottoText motto =
    text (String.Extra.decapitalize motto)
