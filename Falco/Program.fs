open Falco
open Falco.Routing
open Microsoft.AspNetCore.Builder

let wapp = WebApplication.Create()
let endpoints =
    [
        get "/" (Response.ofPlainText "Hello World!")
    ]

wapp.UseRouting()
    .UseFalco(endpoints)
    .Run(Response.ofPlainText "Not found")
