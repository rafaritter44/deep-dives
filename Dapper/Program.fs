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

let createTable () =
    use conn = getConnection()
    let sql = """
        CREATE TABLE IF NOT EXISTS users (
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL
        )
    """
    conn.Execute sql |> ignore

createTable()

let insertUser name =
    use conn = getConnection()
    let sql = "INSERT INTO users (name) VALUES (@name) RETURNING id"
    conn.QuerySingle<int>(sql, {| name = name |})

insertUser "Rafael" |> printfn "Inserted user %d"

let getUsers () =
    use conn = getConnection()
    conn.Query<string> "SELECT name FROM users"

getUsers() |> printfn "%A"