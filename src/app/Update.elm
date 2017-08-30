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
        Login entryForm ->
            ( model, Cmd.none )

        NavigateTo pathName ->
            ( model, navigateTo pathName )

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

        OnLogin (Ok user) ->
            ( model, Cmd.none )

        OnLogin (Err error) ->
            ( model, Cmd.none )

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

        UpdateEntryForm field updatedValue ->
            let
                oldEntryForm =
                    model.entryForm

                editedEntryForm =
                    updateEntryForm field updatedValue oldEntryForm
            in
            ( { model | entryForm = editedEntryForm }, Cmd.none )

        UpdateMotto updatedText ->
            ( updatedMottoForm updatedText model, Cmd.none )

        UpdateUser field updatedValue ->
            let
                oldUserForm =
                    model.editUserForm

                editedUserForm =
                    updateUserForm field updatedValue oldUserForm
            in
            ( { model | editUserForm = editedUserForm }, Cmd.none )



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


updateEntryForm : String -> String -> EntryForm -> EntryForm
updateEntryForm field updatedValue oldEntryForm =
    case field of
        "email" ->
            { oldEntryForm | email = updatedValue }

        "password" ->
            { oldEntryForm | password = updatedValue }

        _ ->
            oldEntryForm


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
