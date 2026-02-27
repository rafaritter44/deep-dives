open Falco
open Falco.Markup
open Falco.Routing
open Falco.Security
open Microsoft.AspNetCore.Builder
open Microsoft.AspNetCore.Http
open Microsoft.Extensions.DependencyInjection
open Microsoft.Net.Http.Headers
open System
open System.IO
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

let oldUrlHandler : HttpHandler =
    Response.redirectPermanently "/new-url" // HTTP 301

let redirectUrlHandler : HttpHandler =
    Response.redirectTemporarily "/new-url" // HTTP 302

let inlineBinaryHandler : HttpHandler =
    let contentType = "image/png"
    let headers = [ HeaderNames.CacheControl,  "no-store, max-age=0" ]
    let bytes = File.ReadAllBytes "fsharp-logo.png"
    Response.ofBinary contentType headers bytes

let attachmentHandler : HttpHandler =
    let filename = "fsharp-logo.png"
    let contentType = "image/png"
    let headers = [ HeaderNames.CacheControl,  "no-store, max-age=0" ]
    let bytes = File.ReadAllBytes filename
    Response.ofAttachment filename contentType headers bytes

let notFoundHandler : HttpHandler =
    Response.withStatusCode 404
    >> Response.ofPlainText "Not Found"

let handlerWithHeaders : HttpHandler =
    Response.withHeaders [ "Content-Language", "en-us" ]
    >> Response.ofPlainText "Hello, headers!"

let handlerWithCookie : HttpHandler =
    Response.withCookie "greeted" "1"
    >> Response.ofPlainText "Hello, cookies!"

let handlerWithCookieOptions : HttpHandler =
    let options = CookieOptions()
    options.Expires <- DateTime.Now.AddMinutes 1
    Response.withCookieOptions options "greeted" "1"
    >> Response.ofPlainText "Hello, cookie options!"

let manualQueryHandler : HttpHandler = fun ctx ->
    let q = Request.getQuery ctx
    let person =
        { First = q.GetString ("FirstName", "John") // Get value or return default value
          Last  = q.GetString ("LastName", "Doe") }
    Response.ofJson person ctx

let mapQueryHandler : HttpHandler =
    Request.mapQuery (fun q ->
        let first = q.GetString ("FirstName", "John") // Get value or return default value
        let last = q.GetString ("LastName", "Doe")
        { First = first; Last = last })
        Response.ofJson

let manualFormHandler : HttpHandler = fun ctx ->
    task {
        let! f : FormData = Request.getForm ctx
        let person =
            { First = f.GetString ("first_name", "John") // Get value or return default value
              Last = f.GetString ("last_name", "Doe") }
        return! Response.ofJson person ctx
    }

let mapFormHandler : HttpHandler =
    Request.mapForm (fun f ->
        let first = f.GetString ("first_name", "John") // Get value or return default value
        let last = f.GetString ("last_name", "Doe")
        { First = first; Last = last })
        Response.ofJson

let endpoints =
    [
        get "/" (Response.ofPlainText "Hello, World!")
        get "/hello/{name:alpha}" (fun ctx ->
            let route = Request.getRoute ctx
            let name = route.GetString "name"
            let message = sprintf "Hello, %s!" name
            Response.ofPlainText message ctx)
        mapGet "/hello2/{name:alpha}" (fun route -> route.GetString "name") greetingHandler
        mapGet "/hello3/{Name}" (fun r -> r?Name.AsString()) Response.ofPlainText
        mapGet "/hello4/{Name}"
            (fun r -> r.TryGetString "Name" |> Option.defaultValue "John")
            Response.ofPlainText
        all "/form" [
            GET, Response.ofHtml form
            POST, Response.ofEmpty ]
        get "/html" htmlHandler
        get "/secureHtml" secureHtmlHandler
        // post "/secureHtml" manualFormHandler
        post "/secureHtml" mapFormHandler
        get "/htmlString" htmlStringHandler
        get "/htmlFragment" fragmentHandler
        get "/json" jsonHandler
        get "/jsonOptions" jsonOptionsHandler
        get "/301" oldUrlHandler
        get "/302" redirectUrlHandler
        get "/new-url" (Response.ofPlainText "New URL")
        get "/inlineBinary" inlineBinaryHandler
        get "/attachment" attachmentHandler
        get "/notFound" notFoundHandler
        get "/headers" handlerWithHeaders
        get "/cookie" handlerWithCookie
        get "/cookieOptions" handlerWithCookieOptions
        get "/query" manualQueryHandler
        get "/query2" mapQueryHandler
    ]

wapp.UseRouting()
    .UseFalco(endpoints)
    .Run(Response.ofPlainText "Not found")
