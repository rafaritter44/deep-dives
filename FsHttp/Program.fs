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

http {
    GET (url "Countries")
}
|> Request.send
|> Response.toJson
|> fun json -> json.Deserialize<Country list> jsonOptions
|> printfn "%A"