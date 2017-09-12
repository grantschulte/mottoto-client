module Messages exposing (..)

import Http exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = CreateUser CreateUserForm
    | GetToken
    | GetUserFromToken String
    | SetToken String
    | LoginUser LoginUserForm
    | LogoutUser
    | OnCreateUser (Result Http.Error User)
    | OnDeleteUser (Result Http.Error User)
    | OnGetUserFromToken (Result Http.Error User)
    | OnFetchAuthors (WebData (List Author))
    | OnFetchAuthor (WebData Author)
    | OnLocationChange Location
    | OnLoginUser (Result Http.Error User)
    | NavigateTo String
    | OnSaveMotto (Result Http.Error Motto)
    | OnSaveUser (Result Http.Error User)
    | SaveMotto EditMottoForm
    | SaveUser EditUserForm
    | UpdateCreateForm String String
    | UpdateMottoForm MottoText
    | UpdateUserForm String String
    | UpdateLoginForm String String
