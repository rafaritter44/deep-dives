open System.Data
open Dapper
open Npgsql

let connectionString =
    "Host=localhost;Username=postgres;Password=example;Database=postgres"

let getConnection () =
    new NpgsqlConnection(connectionString) :> IDbConnection

let testConnection () =
    use conn = getConnection()
    conn.QuerySingle<int> "SELECT 1" = 1

testConnection() |> printfn "Connection works: %b"

let testConnectionAsync () =
    task {
        use conn = getConnection()
        let! result = conn.QuerySingleAsync<int> "SELECT 1"
        return result = 1
    }

testConnectionAsync().Result |> printfn "Async connection works: %b"

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

let createTableAsync () =
    task {
        use conn = getConnection()
        let sql = """
            CREATE TABLE IF NOT EXISTS users (
                id SERIAL PRIMARY KEY,
                name TEXT NOT NULL
            )
        """
        let! _ = conn.ExecuteAsync sql
        return ()
    }

createTableAsync().Result

let insertUser name =
    use conn = getConnection()
    let sql = "INSERT INTO users (name) VALUES (@name) RETURNING id"
    conn.QuerySingle<int>(sql, {| name = name |})

insertUser "Rafael" |> printfn "Inserted user %d"

let insertUserAsync name =
    task {
        use conn = getConnection()
        let sql = "INSERT INTO users (name) VALUES (@name) RETURNING id"
        return! conn.QuerySingleAsync<int>(sql, {| name = name |})
    }

(insertUserAsync "Rafa").Result |> printfn "Inserted user async: %d"

let getUserNames () =
    use conn = getConnection()
    conn.Query<string> "SELECT name FROM users"

getUserNames() |> printfn "%A"

type User =
    { Id   : int
      Name : string }

let getUsers () =
    use conn = getConnection()
    conn.Query<User> "SELECT id, name FROM users"

getUsers() |> printfn "%A"

let getUser id =
    use conn = getConnection()
    let sql = "SELECT id, name FROM users WHERE id = @id"
    conn.QuerySingle<User>(sql, {| id = id |})

getUser 1 |> printfn "%A"

let updateUser user =
    use conn = getConnection()
    let sql = "UPDATE users SET name = @Name WHERE id = @Id"
    conn.Execute(sql, user) = 1

let user =
    { Id   = 1
      Name = "Ritter" }
updateUser user |> printfn "User updated: %b"