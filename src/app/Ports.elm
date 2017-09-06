port module Ports exposing (..)

-- INTEROP


port setToken : String -> Cmd msg


port getToken : () -> Cmd msg


port removeToken : () -> Cmd msg


port getUserFromToken : (String -> msg) -> Sub msg
