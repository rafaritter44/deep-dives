open System.Data
open Dapper
open Npgsql

let connectionString =
    "Host=localhost;Username=postgres;Password=example;Database=postgres"

let getConnection () =
    new NpgsqlConnection(connectionString) :> IDbConnection

let test () =
    use conn = getConnection()
    conn.QuerySingle<int> "SELECT 1"

test() |> printfn "Result: %d"