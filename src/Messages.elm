module Messages exposing (..)

import Http exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = NoOp
    | UpdateMotto MottoText
    | SaveMotto Motto
    | OnSaveMotto (Result Http.Error Motto)
    | OnFetchMotto (WebData Motto)
    | OnFetchUserList (WebData (List User))
    | OnFetchUser (WebData User)
    | OnLocationChange Location
