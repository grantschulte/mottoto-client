module Commands exposing (..)

import Messages exposing (..)
import Models exposing (ApiUrl, AuthorizedUser, Model, Motto, MottoId, Route, User, UserId)
import Navigation exposing (..)
import Routing exposing (entryPath)
import Users.Commands exposing (fetchUser, fetchUserList)


-- NAVIGATE


navigateTo : String -> Cmd Msg
navigateTo newPath =
    Navigation.newUrl newPath



-- ON LOCATION CHANGE


onLocationChangeCmd : Model -> Route -> Cmd Msg
onLocationChangeCmd model route =
    case route of
        Models.BrowseRoute ->
            fetchUserList model.env.apiUrl

        Models.AuthorRoute userId ->
            fetchUser model.env.apiUrl userId

        Models.EditMottoRoute ->
            case model.authorizedUser of
                Nothing ->
                    navigateTo entryPath

                Just user ->
                    Cmd.none

        Models.EditUserRoute ->
            case model.authorizedUser of
                Nothing ->
                    navigateTo entryPath

                Just user ->
                    Cmd.none

        _ ->
            Cmd.none
