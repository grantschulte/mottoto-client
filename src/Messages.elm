module Messages exposing (..)

import Models exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


-- MESSAGES


type Msg
    = NoOp
    | OnFetchAuthor (WebData Author)
    | OnLocationChange Location
