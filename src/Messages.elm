module Messages exposing (..)

import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = NoOp
    | OnFetchMotto (WebData Motto)
    | OnLocationChange Location
