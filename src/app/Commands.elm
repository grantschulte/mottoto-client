module Commands exposing (..)

import Authors.Commands exposing (fetchAuthor, fetchAuthors)
import Messages exposing (..)
import Models exposing (..)
import Navigation exposing (..)
import Routing exposing (entryPath)


-- NAVIGATE


navigateTo : String -> Cmd Msg
navigateTo newPath =
    Navigation.newUrl newPath



-- ON LOCATION CHANGE


onLocationChangeCmd : Model -> Route -> Cmd Msg
onLocationChangeCmd model route =
    case route of
        Models.AuthorsIndexRoute ->
            fetchAuthors model.env.apiUrl

        Models.AuthorsDetailRoute userHandle ->
            fetchAuthor model.env.apiUrl userHandle

        Models.EditMottoRoute ->
            case model.user of
                Nothing ->
                    navigateTo entryPath

                Just user ->
                    Cmd.none

        Models.EditUserRoute ->
            case model.user of
                Nothing ->
                    navigateTo entryPath

                Just user ->
                    Cmd.none

        _ ->
            Cmd.none
