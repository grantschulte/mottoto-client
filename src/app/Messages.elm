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
    | SaveMotto Motto
    | SaveProfile EditProfileForm
    | UpdateMotto MottoText
    | UpdateProfile String String
