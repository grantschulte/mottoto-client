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



-- TYPES: MOTTO


type alias Motto =
    { id : MottoId
    , text : MottoText
    , userId : UserId
    }


type alias MottoId =
    Int


type alias MottoText =
    String



-- TYPES: USER


type alias User =
    { id : UserId
    , email : UserEmail
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


type alias UserId =
    Int



-- TYPES: MODEL


type alias Model =
    { apiUrl : ApiUrl
    , author : WebData Author
    , mottos : WebData (List Motto)
    , motto : WebData Motto
    , nodeEnv : NodeEnv
    , route : Route
    , user : User
    }



-- TYPES: ROUTE


type Route
    = EntryRoute
    | NotFoundRoute
    | MottoDetailRoute MottoId
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
    , mottos = RemoteData.Loading
    , motto = RemoteData.Loading
    , nodeEnv = flags.nodeEnv
    , route = route
    , user = User 1 "orjazzmic@gmail.com" "avantgrant" "Today is a great day." "111.aaa.222"
    }
