open Falco
open Falco.Markup
open Falco.Routing
open Falco.Security
open Microsoft.AspNetCore.Builder
open Microsoft.Extensions.DependencyInjection
open System.Text.Json
open System.Text.Json.Serialization

let builder = WebApplication.CreateBuilder()
builder.Services.AddAntiforgery() |> ignore
let wapp = builder.Build()

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

// Automatically protect against XSS attacks
let secureHtmlHandler : HttpHandler =
    let html token =
        _html [] [
            _body [] [
                _form [ _method_ "post" ] [
                    _input [ _name_ "first_name" ]
                    _input [ _name_ "last_name" ]
                    // using the CSRF HTML helper
                    Xsrf.antiforgeryInput token
                    _input [ _type_ "submit"; _value_ "Submit" ]
                ]
            ]
        ]
    Response.ofHtmlCsrf html

let htmlStringHandler : HttpHandler =
    Response.ofHtmlString "<html><body><h1>Test</h1></body></html>"

let fragmentHandler : HttpHandler =
    let html =
        _div [ _id_ "greeting" ] [
            _h1 [ _id_ "heading" ] [ _text "Hello, World!" ]
        ]
    Response.ofFragment "heading" html

type Person =
    { First : string
      Last  : string }

let jsonHandler : HttpHandler =
    let name = { First = "John"; Last = "Doe" }
    Response.ofJson name

let jsonOptionsHandler : HttpHandler =
    let options = JsonSerializerOptions()
    options.DefaultIgnoreCondition <- JsonIgnoreCondition.WhenWritingNull
    let name = { First = "John"; Last = null }
    Response.ofJsonOptions options name

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
        get "/secureHtml" secureHtmlHandler
        get "/htmlString" htmlStringHandler
        get "/htmlFragment" fragmentHandler
        get "/json" jsonHandler
        get "/jsonOptions" jsonOptionsHandler
    ]

wapp.UseRouting()
    .UseFalco(endpoints)
    .Run(Response.ofPlainText "Not found")
