module Update exposing (..)

import Commands exposing (navigateTo, onLocationChangeCommand, saveMottoCmd)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (authorPath, parseLocation)


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- TODO AUTHENTICATE USER
        AuthenticateUser ->
            ( model, Cmd.none )

        -- TODO CREATE USER
        CreateUser ->
            ( model, Cmd.none )

        -- TODO ON AUTHENTICATE USER
        OnAuthenticateUser ->
            ( model, Cmd.none )

        -- TODO ON CREATE USER
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

        -- TODO SAVE PROFILE
        SaveProfile profile ->
            ( model, Cmd.none )

        SaveMotto motto ->
            ( model, saveMottoCmd model motto )

        UpdateProfile field updatedValue ->
            let
                oldProfileForm =
                    model.editProfileForm

                newProfileForm =
                    updateProfileForm field updatedValue oldProfileForm
            in
            ( { model | editProfileForm = newProfileForm }, Cmd.none )

        UpdateMotto updatedText ->
            ( updatedModelMotto updatedText model, Cmd.none )



-- HELPERS


updatedModelMotto : String -> Model -> Model
updatedModelMotto updatedText ({ motto } as model) =
    { model
        | motto = { motto | text = updatedText }
    }


getMottoFromResponse : Model -> WebData Motto -> Motto
getMottoFromResponse model response =
    case response of
        RemoteData.Success motto ->
            motto

        _ ->
            model.motto


updateProfileForm : String -> String -> EditProfileForm -> EditProfileForm
updateProfileForm field updatedValue oldProfileForm =
    case field of
        "email" ->
            { oldProfileForm | email = updatedValue }

        "handle" ->
            { oldProfileForm | handle = updatedValue }

        "password" ->
            { oldProfileForm | password = updatedValue }

        _ ->
            oldProfileForm
