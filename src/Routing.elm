module Routing exposing (..)

import Models exposing (AuthorHandle, Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


-- ROUTES


welcomeRoute : String
welcomeRoute =
    "#"


entryRoute : String
entryRoute =
    "#entry"


authorRoute : AuthorHandle -> String
authorRoute handle =
    "#author/" ++ handle


browseRoute : String
browseRoute =
    "#browse"



-- FUNCTIONS


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map WelcomeRoute top
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
