module Models exposing (..)

import RemoteData exposing (WebData)


-- TYPES: ENV


type alias Flags =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }


type alias ApiUrl =
    String


type alias NodeEnv =
    String



-- TYPES: AUTHOR


type alias Author =
    { email : AuthorEmail
    , handle : AuthorHandle
    , motto : AuthorMotto
    }


type alias AuthorHandle =
    String


type alias AuthorMotto =
    String


type alias AuthorEmail =
    String



-- TYPES: MODEL


type alias Model =
    { apiUrl : ApiUrl
    , author : WebData Author
    , nodeEnv : NodeEnv
    , route : Route
    }



-- TYPES: ROUTE


type Route
    = AuthorRoute AuthorHandle
    | EntryRoute
    | NotFoundRoute
    | SiteStatusRoute
    | WelcomeRoute



-- INITIAL MODEL


initialModel : Flags -> Route -> Model
initialModel flags route =
    { apiUrl = flags.apiUrl
    , author = RemoteData.Loading
    , nodeEnv = flags.nodeEnv
    , route = route
    }
