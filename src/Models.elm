module Models exposing (..)

-- TYPES


type alias AuthorHandle =
    String


type alias ApiUrl =
    String


type alias NodeEnv =
    String


type alias Greeting =
    String


type alias Model =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    , route : Route
    , author : AuthorHandle
    }


type alias Flags =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }


type Route
    = WelcomeRoute
    | EntryRoute
    | SiteStatusRoute
    | NotFoundRoute



-- INITIAL MODEL


initialModel : Flags -> Route -> Model
initialModel flags route =
    { apiUrl = flags.apiUrl
    , nodeEnv = flags.nodeEnv
    , route = route
    , author = ""
    }
