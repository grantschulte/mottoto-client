module Update exposing (..)

import Auth.Commands exposing (createUserCmd, loginUserCmd)
import Commands exposing (navigateTo, onLocationChangeCmd)
import Http
import Messages exposing (..)
import Models exposing (..)
import Mottos.Commands exposing (saveMottoCmd)
import Ports exposing (getToken, removeToken, setToken)
import Routing exposing (authorPath, editMottoPath, parseLocation, welcomePath)
import Users.Commands exposing (getUserFromTokenCmd, saveUserCmd)
import Utils.Errors exposing (httpError)


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CreateUser createForm ->
            ( model, createUserCmd model createForm )

        GetToken ->
            ( model, Cmd.none )

        GetUserFromToken token ->
            ( model, getUserFromTokenCmd model token )

        LoginUser loginForm ->
            ( model, loginUserCmd model loginForm )

        LogoutUser ->
            ( { model
                | user = Nothing
              }
            , Cmd.batch
                [ navigateTo welcomePath
                , removeToken ()
                ]
            )

        NavigateTo pathName ->
            ( model, navigateTo pathName )

        OnCreateUser (Ok user) ->
            ( { model
                | user = Just user
                , editUserForm = editFormToUser model.editUserForm user
              }
            , Cmd.batch
                [ navigateTo editMottoPath
                , setToken user.token
                ]
            )

        OnCreateUser (Err error) ->
            let
                oldCreateForm =
                    model.createForm

                updatedCreateForm =
                    createFormErrors oldCreateForm error
            in
            ( { model | createForm = updatedCreateForm }, Cmd.none )

        OnFetchAuthor response ->
            ( { model | author = response }, Cmd.none )

        OnFetchAuthors response ->
            ( { model | authors = response }, Cmd.none )

        OnGetUserFromToken (Ok user) ->
            ( { model
                | user = Just user
                , editUserForm = editFormToUser model.editUserForm user
              }
            , Cmd.batch
                [ navigateTo editMottoPath
                , setToken user.token
                ]
            )

        OnGetUserFromToken (Err error) ->
            ( model, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }
            , onLocationChangeCmd model newRoute
            )

        OnLoginUser (Ok user) ->
            ( { model
                | user = Just user
                , editUserForm = editFormToUser model.editUserForm user
              }
            , Cmd.batch
                [ navigateTo editMottoPath
                , setToken user.token
                ]
            )

        OnLoginUser (Err error) ->
            let
                oldLoginForm =
                    model.loginForm

                updatedLoginForm =
                    loginFormErrors oldLoginForm error
            in
            ( { model | loginForm = updatedLoginForm }, Cmd.none )

        OnSaveMotto (Ok motto) ->
            ( { model
                | user = updateUserWithMotto model.user motto
              }
            , navigateTo (authorPath (userHandle model.user))
            )

        OnSaveMotto (Err error) ->
            ( model, Cmd.none )

        OnSaveUser (Ok user) ->
            ( { model
                | user = Just user
                , editUserForm = editFormToUser model.editUserForm user
              }
            , Cmd.batch
                [ navigateTo (authorPath user.handle)
                , setToken user.token
                ]
            )

        OnSaveUser (Err error) ->
            let
                oldEditUserForm =
                    model.editUserForm

                updatedEditUserForm =
                    editUserFormErrors oldEditUserForm error
            in
            ( { model | editUserForm = updatedEditUserForm }, Cmd.none )

        SetToken token ->
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


getTokenFromUser : Maybe User -> String
getTokenFromUser user =
    case user of
        Nothing ->
            ""

        Just user ->
            user.token


editFormToUser : EditUserForm -> User -> EditUserForm
editFormToUser editUserForm user =
    { editUserForm
        | email = user.email
        , handle = user.handle
    }


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


createFormErrors : CreateUserForm -> Http.Error -> CreateUserForm
createFormErrors createForm error =
    { createForm | error = Just (httpError error) }


loginFormErrors : LoginUserForm -> Http.Error -> LoginUserForm
loginFormErrors loginForm error =
    { loginForm | error = Just (httpError error) }


editUserFormErrors : EditUserForm -> Http.Error -> EditUserForm
editUserFormErrors editUserForm error =
    { editUserForm | error = Just (httpError error) }


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


setTokenOnUser : Maybe User -> Token -> Maybe User
setTokenOnUser user newToken =
    case user of
        Nothing ->
            Nothing

        Just user ->
            Just { user | token = newToken }


updateLoginForm : String -> String -> LoginUserForm -> LoginUserForm
updateLoginForm field updatedValue oldLoginForm =
    case field of
        "login-email" ->
            { oldLoginForm | email = updatedValue }

        "login-password" ->
            { oldLoginForm | password = updatedValue }

        _ ->
            oldLoginForm


updateCreateForm : String -> String -> CreateUserForm -> CreateUserForm
updateCreateForm field updatedValue oldCreateForm =
    case field of
        "create-email" ->
            { oldCreateForm | email = updatedValue }

        "create-handle" ->
            { oldCreateForm | handle = updatedValue }

        "create-password" ->
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

        "password" ->
            { oldUserForm | password = updatedValue }

        _ ->
            oldUserForm
