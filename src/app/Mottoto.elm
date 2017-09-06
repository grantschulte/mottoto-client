port module Mottoto exposing (..)

import Commands exposing (onLocationChangeCmd)
import Messages exposing (..)
import Models exposing (Flags, Model, initialModel)
import Navigation exposing (..)
import Ports exposing (getToken, getUserFromToken)
import Routing exposing (parseLocation)
import Update exposing (update)
import View exposing (view)


-- INIT


init : Flags -> Location -> ( Model, Cmd Msg )
init flags location =
    let
        currentRoute =
            parseLocation location

        model =
            initialModel flags currentRoute
    in
    ( model
    , Cmd.batch
        [ onLocationChangeCmd model currentRoute
        , getToken ()
        ]
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ getUserFromToken GetUserFromToken
        ]



-- MAIN


main : Program Flags Model Msg
main =
    Navigation.programWithFlags Messages.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
