module Update exposing (..)

import Auth.Commands exposing (loginUserCmd)
import Commands exposing (navigateTo, onLocationChangeCmd)
import Http
import Messages exposing (..)
import Models exposing (..)
import Mottos.Commands exposing (saveMottoCmd)
import Routing exposing (authorPath, editMottoPath, parseLocation)
import Users.Commands exposing (saveUserCmd)
import Utils.Errors exposing (httpError)


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CreateUser createForm ->
            ( model, Cmd.none )

        LoginUser loginForm ->
            ( model, loginUserCmd model loginForm )

        NavigateTo pathName ->
            ( model, navigateTo pathName )

        OnFetchAuthor response ->
            ( { model | author = response }, Cmd.none )

        OnFetchAuthors response ->
            ( { model | authors = response }, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }
            , onLocationChangeCmd model newRoute
            )

        OnLoginUser (Ok user) ->
            ( { model | user = Just user }, navigateTo editMottoPath )

        OnLoginUser (Err error) ->
            let
                oldLoginForm =
                    model.loginForm

                updatedLoginForm =
                    loginFormErrors oldLoginForm error
            in
            ( { model | loginForm = updatedLoginForm }, Cmd.none )

        OnSaveMotto (Ok motto) ->
            ( { model | user = updateUserWithMotto model.user motto }
            , navigateTo (authorPath (userHandle model.user))
            )

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

        UpdateCreateForm field updatedValue ->
            let
                oldCreateForm =
                    model.createForm

                editedCreateForm =
                    updateCreateForm field updatedValue oldCreateForm
            in
            ( { model | createForm = editedCreateForm }, Cmd.none )

        UpdateLoginForm field updatedValue ->
            let
                oldLoginForm =
                    model.loginForm

                editedLoginForm =
                    updateLoginForm field updatedValue oldLoginForm
            in
            ( { model | loginForm = editedLoginForm }, Cmd.none )

        UpdateMottoForm updatedText ->
            ( updatedMottoForm updatedText model, Cmd.none )

        UpdateUserForm field updatedValue ->
            let
                oldUserForm =
                    model.editUserForm

                editedUserForm =
                    updateUserForm field updatedValue oldUserForm
            in
            ( { model | editUserForm = editedUserForm }, Cmd.none )



-- HELPERS
-- getUserFromMaybe : Maybe User -> Maybe User
-- getUserFromMaybe user =
--     case user of
--         Nothing ->
--           Nothing
--
--         Just user ->
--             Just user


userHandle : Maybe User -> UserHandle
userHandle user =
    case user of
        Nothing ->
            ""

        Just user ->
            user.handle


updateUserWithMotto : Maybe User -> Motto -> Maybe User
updateUserWithMotto user motto =
    case user of
        Nothing ->
            Nothing

        Just user ->
            Just { user | motto = motto }


loginFormErrors : LoginUserForm -> Http.Error -> LoginUserForm
loginFormErrors loginForm error =
    { loginForm | error = Just (httpError error) }


saveUser : Model -> EditUserForm -> Cmd Msg
saveUser model userForm =
    case model.user of
        Nothing ->
            Cmd.none

        Just user ->
            saveUserCmd model user userForm


saveMotto : Model -> EditMottoForm -> Cmd Msg
saveMotto model mottoForm =
    case model.user of
        Nothing ->
            Cmd.none

        Just user ->
            saveMottoCmd model user mottoForm


updateLoginForm : String -> String -> LoginUserForm -> LoginUserForm
updateLoginForm field updatedValue oldLoginForm =
    case field of
        "email" ->
            { oldLoginForm | email = updatedValue }

        "password" ->
            { oldLoginForm | password = updatedValue }

        _ ->
            oldLoginForm


updateCreateForm : String -> String -> CreateUserForm -> CreateUserForm
updateCreateForm field updatedValue oldCreateForm =
    case field of
        "email" ->
            { oldCreateForm | email = updatedValue }

        "handle" ->
            { oldCreateForm | handle = updatedValue }

        "password" ->
            { oldCreateForm | password = updatedValue }

        _ ->
            oldCreateForm


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
