module Routing exposing (..)

import Models exposing (AuthorHandle, Route(..), UserHandle)
import Navigation exposing (Location)
import UrlParser exposing (..)


-- PATHS


welcomePath : String
welcomePath =
    "#"


entryPath : String
entryPath =
    "#entry"


mottoDetailPath : AuthorHandle -> String
mottoDetailPath handle =
    "#mottos/" ++ handle


mottosPath : String
mottosPath =
    "#mottos"


userEditMottoPath : UserHandle -> String
userEditMottoPath handle =
    "#user/" ++ handle ++ "/motto"


userEditProfilePath : UserHandle -> String
userEditProfilePath handle =
    "#user/" ++ handle ++ "/edit"



-- PARSING


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map WelcomeRoute top
        , map UserEditMottoRoute (s "user" </> string </> s "motto")
        , map UserEditProfileRoute (s "user" </> string </> s "edit")
        , map MottoListRoute (s "mottos")
        , map MottoDetailRoute (s "mottos" </> string)
        , map EntryRoute (s "entry")
        , map SiteStatusRoute (s "site-status")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
