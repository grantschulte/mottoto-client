module Utils.FormatText exposing (..)

import Models exposing (..)
import String exposing (..)
import String.Extra exposing (..)


formatUserHandle : UserHandle -> String
formatUserHandle handle =
    handle
        |> String.append "— "
        |> String.Extra.decapitalize
        |> String.toLower


formatMottoText : MottoText -> String
formatMottoText mottoText =
    mottoText
        |> String.Extra.decapitalize
        |> String.toLower
