open Falco
open Falco.Routing
open Microsoft.AspNetCore.Builder

let wapp = WebApplication.Create()
let endpoints =
    [
        get "/" (Response.ofPlainText "Hello, World!")
        get "/hello/{name:alpha}" (fun ctx ->
            let route = Request.getRoute ctx
            let name = route.GetString "name"
            let message = sprintf "Hello, %s!" name
            Response.ofPlainText message ctx)
    ]

wapp.UseRouting()
    .UseFalco(endpoints)
    .Run(Response.ofPlainText "Not found")
