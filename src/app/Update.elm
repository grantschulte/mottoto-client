module Update exposing (..)

import Commands exposing (navigateTo, onLocationChangeCommand, saveMottoCmd)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Routing exposing (authorPath, parseLocation)
import Users.Commands exposing (saveUserCmd)


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

        OnSaveUser (Ok user) ->
            ( model, navigateTo (authorPath user.id) )

        OnSaveUser (Err error) ->
            ( model, Cmd.none )

        SaveUser userForm ->
            ( model, isLoggedIn model userForm )

        SaveMotto motto ->
            ( model, saveMottoCmd model motto )

        UpdateUser field updatedValue ->
            let
                oldUserForm =
                    model.editUserForm

                editedUserForm =
                    updateUserForm field updatedValue oldUserForm
            in
            ( { model | editUserForm = editedUserForm }, Cmd.none )

        UpdateMotto updatedText ->
            ( updatedModelMotto updatedText model, Cmd.none )



-- HELPERS


isLoggedIn : Model -> EditUserForm -> Cmd Msg
isLoggedIn model userForm =
    case model.authorizedUser of
        Nothing ->
            Cmd.none

        Just user ->
            saveUserCmd model user userForm


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


updateUserForm : String -> String -> EditUserForm -> EditUserForm
updateUserForm field updatedValue oldUserForm =
    case field of
        "email" ->
            { oldUserForm | email = updatedValue }

        "handle" ->
            { oldUserForm | handle = updatedValue }

        _ ->
            oldUserForm
