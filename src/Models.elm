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



-- TYPES: USER


type alias User =
    { email : UserEmail
    , handle : UserHandle
    , motto : UserMotto
    , token : UserToken
    }


type alias UserEmail =
    String


type alias UserHandle =
    String


type alias UserMotto =
    String


type alias UserToken =
    String



-- TYPES: MODEL


type alias Model =
    { apiUrl : ApiUrl
    , author : WebData Author
    , user : User
    , nodeEnv : NodeEnv
    , route : Route
    }



-- TYPES: ROUTE


type Route
    = EntryRoute
    | NotFoundRoute
    | MottoDetailRoute AuthorHandle
    | MottoListRoute
    | SiteStatusRoute
    | UserEditProfileRoute UserHandle
    | UserEditMottoRoute UserHandle
    | WelcomeRoute



-- INITIAL MODEL


initialModel : Flags -> Route -> Model
initialModel flags route =
    { apiUrl = flags.apiUrl
    , author = RemoteData.Loading
    , user = User "orjazzmic@gmail.com" "avantgrant" "Today is a great day." "111.aaa.222"
    , nodeEnv = flags.nodeEnv
    , route = route
    }
