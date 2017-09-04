module Messages exposing (..)

import Http exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = Login EntryForm
    | OnFetchAuthors (WebData (List Author))
    | OnFetchAuthor (WebData Author)
    | OnLocationChange Location
    | OnLogin (Result Http.Error User)
    | NavigateTo String
    | OnSaveMotto (Result Http.Error Motto)
    | OnSaveUser (Result Http.Error User)
    | SaveMotto EditMottoForm
    | SaveUser EditUserForm
    | UpdateMottoForm MottoText
    | UpdateUserForm String String
    | UpdateEntryForm String String
