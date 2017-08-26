module Update exposing (..)

import Commands exposing (navigateTo, onLocationChangeCmd)
import Messages exposing (..)
import Models exposing (..)
import Motto.Commands exposing (saveMottoCmd)
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
            , onLocationChangeCmd model newRoute
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
            ( model, saveUser model userForm )

        SaveMotto mottoForm ->
            ( model, saveMotto model mottoForm )

        UpdateUser field updatedValue ->
            let
                oldUserForm =
                    model.editUserForm

                editedUserForm =
                    updateUserForm field updatedValue oldUserForm
            in
            ( { model | editUserForm = editedUserForm }, Cmd.none )

        UpdateMotto updatedText ->
            ( updatedMottoForm updatedText model, Cmd.none )



-- HELPERS


saveUser : Model -> EditUserForm -> Cmd Msg
saveUser model userForm =
    case model.authorizedUser of
        Nothing ->
            Cmd.none

        Just user ->
            saveUserCmd model user userForm


saveMotto : Model -> EditMottoForm -> Cmd Msg
saveMotto model mottoForm =
    case model.authorizedUser of
        Nothing ->
            Cmd.none

        Just user ->
            saveMottoCmd model user mottoForm


updatedMottoForm : String -> Model -> Model
updatedMottoForm updatedText ({ editMottoForm } as model) =
    { model
        | editMottoForm = { editMottoForm | text = updatedText }
    }


updateUserForm : String -> String -> EditUserForm -> EditUserForm
updateUserForm field updatedValue oldUserForm =
    case field of
        "email" ->
            { oldUserForm | email = updatedValue }

        "handle" ->
            { oldUserForm | handle = updatedValue }

        _ ->
            oldUserForm
