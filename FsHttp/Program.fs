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

let get =
    let request = http {
        GET (url "Countries")
    }
    async {
        use! response = Request.sendAsync request
        return! response |> Response.deserializeJsonWithAsync<Country list> jsonOptions
    }

get |> Async.RunSynchronously |> printfn "%A"