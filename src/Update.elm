module Update exposing (..)

import Commands exposing (onLocationChangeCommand)
import Messages exposing (..)
import Models exposing (..)
import Routing exposing (parseLocation)


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OnFetchAuthor response ->
            ( { model | author = response }, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }, onLocationChangeCommand model newRoute )
