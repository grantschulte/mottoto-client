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



-- TYPES: MOTTO


type alias Motto =
    { id : MottoId
    , text : MottoText
    }


type alias MottoId =
    String


type alias MottoText =
    String



-- TYPES: USER


type alias User =
    { id : UserId
    , email : UserEmail
    , handle : UserHandle
    , motto : Motto
    }


type alias UserEmail =
    String


type alias UserHandle =
    String


type alias UserId =
    String



-- TYPES: AUTHORIZED USER


type alias AuthorizedUser =
    { id : UserId
    , email : UserEmail
    , handle : UserHandle
    , token : AuthToken
    }


type alias AuthToken =
    String



-- TYPES: MODEL


type alias Model =
    { apiUrl : ApiUrl
    , authorizedUser : AuthorizedUser
    , motto : Motto
    , mottos : WebData (List Motto)
    , nodeEnv : NodeEnv
    , route : Route
    , user : WebData User
    , users : WebData (List User)
    }



-- TYPES: ROUTE


type Route
    = AuthorRoute UserId
    | BrowseRoute
    | EditProfileRoute
    | EditMottoRoute
    | EntryRoute
    | NotFoundRoute
    | SiteStatusRoute
    | WelcomeRoute



-- INITIAL MODEL


initialModel : Flags -> Route -> Model
initialModel flags route =
    { apiUrl = flags.apiUrl
    , authorizedUser = AuthorizedUser "100" "orjazzmic@gmail.com" "avantgrant" "111.222.333"
    , mottos = RemoteData.Loading
    , motto = Motto "99" "New Motto"
    , nodeEnv = flags.nodeEnv
    , route = route
    , user = RemoteData.Loading
    , users = RemoteData.Loading
    }
