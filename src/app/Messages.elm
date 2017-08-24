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
    | OnFetchMotto (WebData Motto)
    | OnFetchUserList (WebData (List User))
    | OnFetchUser (WebData User)
    | OnLocationChange Location
    | OnSaveMotto (Result Http.Error Motto)
    | OnSaveUser (Result Http.Error User)
    | SaveMotto Motto
    | SaveUser EditUserForm
    | UpdateMotto MottoText
    | UpdateUser String String
