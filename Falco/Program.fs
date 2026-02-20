open Falco
open Falco.Markup
open Falco.Routing
open Microsoft.AspNetCore.Builder

let wapp = WebApplication.Create()

let greetingHandler name : HttpHandler =
    let message = sprintf "Hello, %s!" name
    Response.ofPlainText message

let form =
    Templates.html5 "en" [] [
        _form [ _method_ "post" ] [
            _input [ _name_ "name" ]
            _input [ _type_ "submit"] ] ]

let htmlHandler : HttpHandler =
    let html =
        _html [ _lang_ "en" ] [
            _head [] []
            _body [] [
                _h1' "Sample App" // shorthand for: _h1 [] [ Text.raw "Sample App" ]
            ]
        ]
    Response.ofHtml html

let endpoints =
    [
        get "/" (Response.ofPlainText "Hello, World!")
        get "/hello/{name:alpha}" (fun ctx ->
            let route = Request.getRoute ctx
            let name = route.GetString "name"
            let message = sprintf "Hello, %s!" name
            Response.ofPlainText message ctx)
        mapGet "/hello2/{name:alpha}" (fun route -> route.GetString "name") greetingHandler
        all "/form" [
            GET, Response.ofHtml form
            POST, Response.ofEmpty ]
        get "/html" htmlHandler
    ]

wapp.UseRouting()
    .UseFalco(endpoints)
    .Run(Response.ofPlainText "Not found")
