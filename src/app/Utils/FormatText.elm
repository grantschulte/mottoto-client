module Utils.FormatText exposing (..)

import Models exposing (..)
import String exposing (..)
import String.Extra exposing (..)


formatHandle : UserHandle -> String
formatHandle handle =
    handle
        |> String.append "— "


formatMottoText : MottoText -> String
formatMottoText mottoText =
    if String.isEmpty mottoText then
        "Silence..."
    else
        mottoText
