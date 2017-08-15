module Models exposing (..)

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
    { handle : AuthorHandle
    , motto : AuthorMotto
    }


type alias AuthorHandle =
    String


type alias AuthorMotto =
    String



-- TYPES: MODEL


type alias Model =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    , route : Route
    , author : Author
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
    , nodeEnv = flags.nodeEnv
    , route = route
    , author = Author "phantummm" "Keep it right, keep it tight."
    }
