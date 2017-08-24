module Routing exposing (..)

import Models exposing (MottoId, Route(..), UserHandle, UserId)
import Navigation exposing (Location)
import UrlParser exposing (..)


-- PATHS


welcomePath : String
welcomePath =
    "#"


entryPath : String
entryPath =
    "#entry"


browsePath : String
browsePath =
    "#browse"


authorPath : UserId -> String
authorPath userId =
    "#author/" ++ userId


editMottoPath : String
editMottoPath =
    "#motto"


editProfilePath : String
editProfilePath =
    "#users/edit"



-- PARSING


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map WelcomeRoute top
        , map EditMottoRoute (s "motto")
        , map EditUserRoute (s "users" </> s "edit")
        , map AuthorRoute (s "author" </> string)
        , map BrowseRoute (s "browse")
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
