module Mottos.Commands exposing (..)

import Http
import Messages exposing (..)
import Models exposing (..)
import Mottos.Decoder exposing (mottoDecoder)
import Mottos.Encoder exposing (mottoFormEncoder)


-- UPDATE MOTTO


saveMottoCmd : Model -> User -> EditMottoForm -> Cmd Msg
saveMottoCmd model user mottoForm =
    saveMottoRequest model.env.apiUrl mottoForm user
        |> Http.send OnSaveMotto


saveMottoRequest : ApiUrl -> EditMottoForm -> User -> Http.Request Motto
saveMottoRequest apiUrl mottoForm user =
    Http.request
        { body = mottoFormEncoder mottoForm |> Http.jsonBody
        , expect = Http.expectJson mottoDecoder
        , headers = [ Http.header "x-access-token" user.token ]
        , method = "PUT"
        , timeout = Nothing
        , url = saveMottoUrl apiUrl
        , withCredentials = False
        }


saveMottoUrl : ApiUrl -> String
saveMottoUrl apiUrl =
    apiUrl ++ "/api/mottos/"
