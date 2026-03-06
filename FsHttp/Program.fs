open FsHttp
open System.Text.Json

let baseUrl = "https://openholidaysapi.org/"
let url path = baseUrl + path
let jsonOptions = JsonSerializerOptions(PropertyNameCaseInsensitive = true)

let get<'T> path =
    let request = http {
        GET (url path)
    }
    async {
        use! response = Request.sendAsync request
        return! response |> Response.deserializeJsonWithAsync<'T> jsonOptions
    }

type Language = string
type Name =
    { Language : Language
      Text     : string }
type Country =
    { IsoCode           : string
      Name              : Name list
      OfficialLanguages : Language list }

let countries = get<Country list> "Countries" |> Async.RunSynchronously
printfn "%A" countries

type LanguageObject =
    { IsoCode : string
      Name    : Name list }

let languages = get<LanguageObject list> "Languages" |> Async.RunSynchronously
printfn "%A" languages