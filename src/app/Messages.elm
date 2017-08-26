module Messages exposing (..)

import Http exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = AuthenticateUser
    | CreateUser
    | OnAuthenticateUser
    | OnCreateUser
    | OnFetchUserList (WebData (List User))
    | OnFetchUser (WebData User)
    | OnLocationChange Location
    | OnSaveMotto (Result Http.Error Motto)
    | OnSaveUser (Result Http.Error User)
    | SaveMotto EditMottoForm
    | SaveUser EditUserForm
    | UpdateMotto MottoText
    | UpdateUser String String
