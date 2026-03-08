open FsHttp
open System
open System.Net
open System.Text.Json

let baseUrl = "https://openholidaysapi.org/"
let url path = baseUrl + path
let jsonOptions = JsonSerializerOptions(PropertyNameCaseInsensitive = true)

let getWithQuery<'T> path queryParams =
    let request = http {
        GET (url path)
        query queryParams
    }
    async {
        use! response = Request.sendAsync request
        if response.statusCode = HttpStatusCode.OK then
            let! typedResponse = response |> Response.deserializeJsonWithAsync<'T> jsonOptions
            return Ok typedResponse
        else
            let! body = response.ToStringAsync None |> Async.AwaitTask
            return Error (sprintf "HTTP %d: %s" (int response.statusCode) body)
    }

let get<'T> path = getWithQuery<'T> path []

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

let queryParams = [
    "countryIsoCode", "BR"
    "languageIsoCode", "PT"
    "validFrom", "2025-01-01"
    "validTo", "2025-12-31" ]
let publicHolidays = getWithQuery<PublicHoliday list> "PublicHolidays" queryParams |> Async.RunSynchronously
printfn "%A" publicHolidays