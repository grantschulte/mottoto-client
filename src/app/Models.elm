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
    , userId : UserId
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
    , motto : Motto
    , token : AuthToken
    }


type alias AuthToken =
    String



-- EDIT MOTTO FORM


type alias EditMottoForm =
    { errors : Maybe (List String)
    , text : MottoText
    }



-- EDIT USER FORM


type alias EditUserForm =
    { email : UserEmail
    , errors : Maybe (List String)
    , handle : UserHandle
    }



-- ENTRY FORM


type alias EntryForm =
    { email : UserEmail
    , errors : Maybe (List String)
    , password : String
    }



-- TYPES: MODEL


type alias Model =
    { authorizedUser : Maybe AuthorizedUser
    , editMottoForm : EditMottoForm
    , editUserForm : EditUserForm
    , entryForm : EntryForm
    , env : Flags
    , route : Route
    , user : WebData User
    , users : WebData (List User)
    }



-- TYPES: ROUTE


type Route
    = AuthorRoute UserId
    | BrowseRoute
    | EditUserRoute
    | EditMottoRoute
    | EntryRoute
    | NotFoundRoute
    | SiteStatusRoute
    | WelcomeRoute



-- INITIAL MODEL


initAuthorizedUser : AuthorizedUser
initAuthorizedUser =
    AuthorizedUser "100" "orjazzmic@gmail.com" "avantgrant" initMotto "111.222.333"


initMotto : Motto
initMotto =
    Motto "100" "New Motto" "100"


initEntryForm : EntryForm
initEntryForm =
    EntryForm "" Nothing ""


initEditMottoForm : EditMottoForm
initEditMottoForm =
    EditMottoForm Nothing ""


initEditUserForm : EditUserForm
initEditUserForm =
    EditUserForm "" Nothing ""


initialModel : Flags -> Route -> Model
initialModel flags route =
    { authorizedUser = Nothing
    , editMottoForm = initEditMottoForm
    , editUserForm = initEditUserForm
    , entryForm = initEntryForm
    , env = flags
    , route = route
    , user = RemoteData.Loading
    , users = RemoteData.Loading
    }
