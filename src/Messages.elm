module Messages exposing (..)

import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = NoOp
    | OnFetchMotto (WebData Motto)
    | OnFetchMottoList (WebData (List Motto))
    | OnLocationChange Location
