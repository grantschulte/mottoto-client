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
    , user : UserId
    }


type alias MottoText =
    String


type alias MottoId =
    String



-- TYPES: AUTHOR


type alias Author =
    { id : UserId
    , handle : UserHandle
    , motto : Motto
    }



-- TYPES: USER


type alias User =
    { id : UserId
    , email : UserEmail
    , handle : UserHandle
    , motto : Motto
    , token : Token
    }


type alias Token =
    String


type alias UserEmail =
    String


type alias UserHandle =
    String


type alias UserId =
    String



-- EDIT MOTTO FORM


type alias EditMottoForm =
    { errors : Maybe (List String)
    , text : String
    }



-- EDIT USER FORM


type alias EditUserForm =
    { email : UserEmail
    , errors : Maybe (List String)
    , handle : UserHandle
    }



-- LOGIN USER FORM


type alias LoginUserForm =
    { email : UserEmail
    , errors : Maybe (List String)
    , password : String
    }



-- CREATE USER FORM


type alias CreateUserForm =
    { email : UserEmail
    , errors : Maybe (List String)
    , handle : UserHandle
    , password : String
    }



-- TYPES: MODEL


type alias Model =
    { author : WebData Author
    , authors : WebData (List Author)
    , createForm : CreateUserForm
    , editMottoForm : EditMottoForm
    , editUserForm : EditUserForm
    , loginForm : LoginUserForm
    , env : Flags
    , route : Route
    , user : Maybe User
    }



-- TYPES: ROUTE


type Route
    = AuthorsDetailRoute UserHandle
    | AuthorsIndexRoute
    | CreateUserRoute
    | EditUserRoute
    | EditMottoRoute
    | LoginUserRoute
    | NotFoundRoute
    | SiteStatusRoute
    | WelcomeRoute



-- INITIAL MODEL


initLoginUserForm : LoginUserForm
initLoginUserForm =
    LoginUserForm "" Nothing ""


initCreateUserForm : CreateUserForm
initCreateUserForm =
    CreateUserForm "" Nothing "" ""


initEditMottoForm : EditMottoForm
initEditMottoForm =
    EditMottoForm Nothing ""


initEditUserForm : EditUserForm
initEditUserForm =
    EditUserForm "" Nothing ""


initialModel : Flags -> Route -> Model
initialModel flags route =
    { author = RemoteData.Loading
    , authors = RemoteData.Loading
    , createForm = initCreateUserForm
    , editMottoForm = initEditMottoForm
    , editUserForm = initEditUserForm
    , loginForm = initLoginUserForm
    , env = flags
    , route = route
    , user = Nothing
    }
