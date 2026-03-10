open System.Data
open Dapper
open Npgsql

let connectionString =
    "Host=localhost;Username=postgres;Password=example;Database=postgres"

let getConnection () =
    new NpgsqlConnection(connectionString) :> IDbConnection

let testConnection () =
    use conn = getConnection()
    conn.QuerySingle<int> "SELECT 1"

testConnection() |> printfn "Result: %d"