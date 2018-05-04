module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { searchString : String
    , results : List String
    }


init : Model
init =
    { searchString = ""
    , results = []
    }



-- UPDATE


type Msg
    = SearchBoxInput String
    | Search


update : Msg -> Model -> Model
update msg model =
    case msg of
        SearchBoxInput input ->
            { model | searchString = input }

        Search ->
            { model | results = search model.searchString }


search : String -> List String
search input =
    [ "elm-la", "elm-oc" ]



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "wrapper" ]
        [ header
        , searchWrap model
        , viewResults model
        ]


header : Html Msg
header =
    div [ class "header" ]
        [ img
            [ class "header-img"
            , src "imgs/meetup-logo.png"
            ]
            []
        ]


searchWrap : Model -> Html Msg
searchWrap model =
    div [ class "searchbox" ]
        [ searchBox
        , searchButton
        ]


searchBox : Html Msg
searchBox =
    div []
        [ i [ class "fas fa-search" ] []
        , input [ onInput SearchBoxInput ] []
        ]


searchButton : Html Msg
searchButton =
    button [ onClick Search ] [ text "Search" ]


viewResults : Model -> Html Msg
viewResults model =
    div [ class "results" ]
        [ ul [] (List.map viewResult model.results)
        ]


viewResult : String -> Html Msg
viewResult result =
    li [] [ text result ]
