import Html exposing (Html, div, h1, form, text, input, button)
import Html.Attributes exposing(..)
import Html.Events exposing(..)
import Browser 

type alias Model = Int

type alias Conversao = { valorInserido : String , valorConvertido : String }


init : Conversao 
init = { valorInserido = "" , valorConvertido = "" }

update : msg -> Conversao -> Conversao
update msg model = init

main = Browser.sandbox { init = init, update = update, view = view }
        

view : Conversao -> Html msg
view user =
    div []
        [ h1 [] [ text "Cambio Facil" ]
        , Html.form []
            [ div []
                [ text "Seleciona Moeda"
                , input
                    [ id "name"
                    , type_ "text"
                    ]
                    []
                ]
            , div []
                [ text "Converter Para"
                , input
                    [ id "email"
                    , type_ "email"
                    ]
                    []
                ]
            , div []
                [ button
                    [ type_ "submit" ]
                    [ text "Converter" ]
                ]
            ]
        ]