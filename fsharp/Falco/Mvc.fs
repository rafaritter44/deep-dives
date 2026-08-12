module Mvc

open Falco
open Falco.Markup
open Falco.Routing

module Model =
    type NameGreeting = { Name : string }
    type Greeting = { Message : string }

module Route =
    let index = "/"
    let greetPlainText = "/greet/text/{name}"
    let greetJson = "/greet/json/{name}"
    let greetHtml = "/greet/html/{name}"

module Url =
    let greetPlainText name = Route.greetPlainText.Replace("{name}", name)
    let greetJson name = Route.greetJson.Replace("{name}", name)
    let greetHtml name = Route.greetHtml.Replace("{name}", name)

module View =
    open Model
    let layout content =
        Templates.html5 "en"
            [ _link [ _href_ "/style.css"; _rel_ "stylesheet" ] ]
            content
    module GreetingView =
        /// HTML view for /greet/html
        let detail greeting =
            layout [
                _h1' $"Hello, {greeting.Name}! From /html"
                _hr []
                _p' "Greet other ways:"
                _nav [] [
                    _a
                        [ _href_ (Url.greetPlainText greeting.Name) ]
                        [ _text "Greet in text"]
                    _text " | "
                    _a
                        [ _href_ (Url.greetJson greeting.Name) ]
                        [ _text "Greet in JSON " ]
                ]
            ]

module Controller =
    open Model
    open View
    module ErrorController =
        let notFound : HttpHandler =
            Response.withStatusCode 404 >>
            Response.ofHtml (layout [ _h1' "Not Found" ])
        let serverException : HttpHandler =
            Response.withStatusCode 500 >>
            Response.ofHtml (layout [ _h1' "Server Error" ])
        let endpoints =
            [ get "/error/not-found" notFound
              get "/error/server-exception" serverException ]
    module GreetingController =
        let index = Response.ofPlainText "Hello, world!"
        let plainTextDetail name = Response.ofPlainText $"Hello, {name}!"
        let jsonDetail name = Response.ofJson { Message = $"Hello, {name}! From /json" }
        let htmlDetail name = { Name = name } |> GreetingView.detail |> Response.ofHtml
        let endpoints =
            let mapRoute (r : RequestData) = r?name.AsString()
            [ get Route.index index
              mapGet Route.greetPlainText mapRoute plainTextDetail
              mapGet Route.greetJson mapRoute jsonDetail
              mapGet Route.greetHtml mapRoute htmlDetail ]
