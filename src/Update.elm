module Update exposing (..)

import Commands exposing (navigateTo, onLocationChangeCommand, saveMottoCmd)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (authorPath, parseLocation)


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
        AuthenticateUser ->
            ( model, Cmd.none )

        CreateUser ->
            ( model, Cmd.none )

        OnAuthenticateUser ->
            ( model, Cmd.none )

        OnCreateUser ->
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

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }
            , onLocationChangeCommand model newRoute
            )

        OnSaveMotto (Ok motto) ->
            ( model, navigateTo (authorPath motto.userId) )

        OnSaveMotto (Err error) ->
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
