module Messages exposing (..)

import Http exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = Login EntryForm
    | OnFetchUserList (WebData (List User))
    | OnFetchUser (WebData User)
    | OnLocationChange Location
    | OnLogin (Result Http.Error AuthorizedUser)
    | NavigateTo String
    | OnSaveMotto (Result Http.Error Motto)
    | OnSaveUser (Result Http.Error User)
    | SaveMotto EditMottoForm
    | SaveUser EditUserForm
    | UpdateMotto MottoText
    | UpdateUser String String
    | UpdateEntryForm String String
