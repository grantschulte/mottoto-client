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


authorPath : AuthorHandle -> String
authorPath handle =
    "#author/" ++ handle


browsePath : String
browsePath =
    "#browse"


userMottoPath : UserHandle -> String
userMottoPath handle =
    "#user/" ++ handle ++ "/motto"


userEditPath : UserHandle -> String
userEditPath handle =
    "#user/" ++ handle ++ "/edit"



-- PARSING


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map WelcomeRoute top
        , map AuthorRoute (s "author" </> string)
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
