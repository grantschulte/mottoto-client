module Models exposing (..)

-- TYPES


type alias ApiUrl =
    String


type alias NodeEnv =
    String


type alias Greeting =
    String


type alias Model =
    { greeting : Greeting
    , apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    , route : Route
    }


type alias Flags =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }


type Route
    = WelcomeRoute
    | SiteStatusRoute
    | NotFoundRoute



-- INITIAL MODEL


initialModel : Flags -> Route -> Model
initialModel flags route =
    { greeting = "Hello from Mottoto"
    , apiUrl = flags.apiUrl
    , nodeEnv = flags.nodeEnv
    , route = route
    }
