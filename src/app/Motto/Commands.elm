module Motto.Commands exposing (..)

import Http
import Messages exposing (..)
import Models exposing (..)
import Motto.Decoder exposing (mottoDecoder)
import Motto.Encoder exposing (mottoFormEncoder)


-- UPDATE MOTTO


saveMottoCmd : Model -> AuthorizedUser -> EditMottoForm -> Cmd Msg
saveMottoCmd model user mottoForm =
    saveMottoRequest model.env.apiUrl mottoForm user
        |> Http.send OnSaveMotto


saveMottoRequest : ApiUrl -> EditMottoForm -> AuthorizedUser -> Http.Request Motto
saveMottoRequest apiUrl mottoForm user =
    Http.request
        { body = mottoFormEncoder mottoForm |> Http.jsonBody
        , expect = Http.expectJson mottoDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveMottoUrl apiUrl user.motto.id
        , withCredentials = False
        }


saveMottoUrl : ApiUrl -> MottoId -> String
saveMottoUrl apiUrl mottoId =
    apiUrl ++ "/mottos/" ++ mottoId
