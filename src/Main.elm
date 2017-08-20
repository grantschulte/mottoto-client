module Main exposing (..)

import Commands exposing (onLocationChangeCommand)
import Messages exposing (..)
import Models exposing (Flags, Model, initialModel)
import Navigation exposing (..)
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
    ( model, onLocationChangeCommand model currentRoute )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Flags Model Msg
main =
    Navigation.programWithFlags Messages.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
