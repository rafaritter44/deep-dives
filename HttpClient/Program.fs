open System.Net.Http
open System.Text.Json
open System.Threading.Tasks

let client = new HttpClient()
let baseUrl = "https://openholidaysapi.org/"
let url path = baseUrl + path
let jsonOptions = JsonSerializerOptions(PropertyNameCaseInsensitive = true)

let get<'T> path : Task<'T> =
    task {
        use! response = client.GetAsync(url path)
        response.EnsureSuccessStatusCode() |> ignore
        use! stream = response.Content.ReadAsStreamAsync()
        let! result = JsonSerializer.DeserializeAsync<'T>(stream, jsonOptions)
        return result
    }

type Language = string
type Name =
    { Language : Language
      Text     : string }
type Country =
    { IsoCode           : string
      Name              : Name list
      OfficialLanguages : Language list }

let countries = (get<Country list> "Countries").Result
printfn "%A" countries

type LanguageObject =
    { IsoCode : string
      Name    : Name list }

let languages = (get<LanguageObject list> "Languages").Result
printfn "%A" languages

client.Dispose()