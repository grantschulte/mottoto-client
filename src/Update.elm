module Update exposing (..)

import Commands exposing (onLocationChangeCommand, saveMottoCmd)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (parseLocation)


getMottoFromResponse : Model -> WebData Motto -> Motto
getMottoFromResponse model response =
    case response of
        RemoteData.Success motto ->
            motto

        _ ->
            model.motto



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OnFetchMotto response ->
            let
                fetchedMotto =
                    getMottoFromResponse model response
            in
            ( { model | motto = fetchedMotto }, Cmd.none )

        OnFetchUser response ->
            ( { model | user = response }, Cmd.none )

        OnFetchUserList response ->
            ( { model | users = response }, Cmd.none )

        OnSaveMotto response ->
            ( model, Cmd.none )

        SaveMotto motto ->
            ( model, saveMottoCmd model motto )

        UpdateMotto updatedText ->
            let
                oldMotto =
                    model.motto

                newMotto =
                    { oldMotto | text = updatedText }
            in
            ( { model | motto = newMotto }, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }, onLocationChangeCommand model newRoute )
