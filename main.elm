module Main exposing (main)

import Browser
import Html exposing (Html, img, text)
import Html.Attributes exposing (src)
import Http
import Json.Decode exposing (Decoder, field, string)


type Model
    = Loading
    | Failure
    | Success String


view : Model -> Html Msg
view model =
    case model of
        Loading ->
            text "loading..."

        Failure ->
            text "Não conseguimos converter, tente novamente mais tarde"

        Success rates ->
            text rates
getMoeda : Cmd Msg
getMoeda =
    Http.get
        { url = "http://api.exchangeratesapi.io/latest?symbols=BRL&base=USD"
        , expect = Http.expectJson GotResult (field "rates" string)
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, getMoeda )


type Msg
    = GotResult (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResult result ->
            case result of
                Ok rates ->
                    ( Success rates, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }