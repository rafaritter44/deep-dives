open System
open System.Collections.Generic
open System.Net.Http
open System.Text.Json
open System.Threading.Tasks
open Microsoft.AspNetCore.WebUtilities

let client = new HttpClient()
let baseUrl = "https://openholidaysapi.org/"
let url path = baseUrl + path
let jsonOptions = JsonSerializerOptions(PropertyNameCaseInsensitive = true)

let getWithQuery<'T> path (query : IDictionary<string,string>) : Task<Result<'T, string>> =
    task {
        let uri = QueryHelpers.AddQueryString(url path, query)
        use! response = client.GetAsync uri
        if response.IsSuccessStatusCode then
            use! stream = response.Content.ReadAsStreamAsync()
            let! typedResponse = JsonSerializer.DeserializeAsync<'T>(stream, jsonOptions)
            return Ok typedResponse
        else
            let! body = response.Content.ReadAsStringAsync()
            return Error (sprintf "HTTP %d: %s" (int response.StatusCode) body)
    }

let get<'T> path = getWithQuery<'T> path (dict [])

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

type Subdivision =
    { Code      : string
      ShortName : string }
type PublicHoliday =
    { Id            : Guid
      Nationwide    : bool
      Type          : string
      RegionalScope : string
      TemporalScope : string
      StartDate     : DateOnly
      EndDate       : DateOnly
      Name          : Name list
      Subdivisions  : Subdivision list }

let queryParams = dict [
    "countryIsoCode", "BR"
    "languageIsoCode", "PT"
    "validFrom", "2025-01-01"
    "validTo", "2025-12-31" ]
let publicHolidays = (getWithQuery<PublicHoliday list> "PublicHolidays" queryParams).Result
printfn "%A" publicHolidays

(get "NonExistentEndpoint").Result |> printfn "%A"

client.Dispose()