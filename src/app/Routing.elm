module Routing exposing (..)

import Models exposing (MottoId, Route(..), UserHandle, UserId)
import Navigation exposing (Location)
import UrlParser exposing (..)


-- PATHS


welcomePath : String
welcomePath =
    "#"


loginPath : String
loginPath =
    "#login"


createPath : String
createPath =
    "#create"


browsePath : String
browsePath =
    "#browse"


authorPath : UserId -> String
authorPath userId =
    "#author/" ++ userId


editMottoPath : String
editMottoPath =
    "#motto/edit"


editUserPath : String
editUserPath =
    "#user/edit"



-- PARSING


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map WelcomeRoute top
        , map EditMottoRoute (s "motto" </> s "edit")
        , map EditUserRoute (s "user" </> s "edit")
        , map AuthorsDetailRoute (s "author" </> string)
        , map AuthorsIndexRoute (s "browse")
        , map LoginUserRoute (s "login")
        , map CreateUserRoute (s "create")
        , map SiteStatusRoute (s "site-status")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
