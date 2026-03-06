open FsHttp
open System.Text.Json

let baseUrl = "https://openholidaysapi.org/"
let url path = baseUrl + path
let jsonOptions = JsonSerializerOptions(PropertyNameCaseInsensitive = true)

type Language = string
type Name =
    { Language : Language
      Text     : string }
type Country =
    { IsoCode           : string
      Name              : Name list
      OfficialLanguages : Language list }

let get<'T> path =
    let request = http {
        GET (url path)
    }
    async {
        use! response = Request.sendAsync request
        return! response |> Response.deserializeJsonWithAsync<'T> jsonOptions
    }

get<Country list> "Countries" |> Async.RunSynchronously |> printfn "%A"