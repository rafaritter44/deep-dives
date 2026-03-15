open System.Data
open System.Threading.Tasks
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

getUserNames() |> printfn "Got user names: %A"

let getUserNamesAsync () =
    task {
        use conn = getConnection()
        return! conn.QueryAsync<string> "SELECT name FROM users"
    }

getUserNamesAsync().Result |> printfn "Got user names async: %A"

type User =
    { Id   : int
      Name : string }

let getUsers () =
    use conn = getConnection()
    conn.Query<User> "SELECT id, name FROM users"

getUsers() |> printfn "Got users: %A"

let getUsersAsync () =
    task {
        use conn = getConnection()
        return! conn.QueryAsync<User> "SELECT id, name FROM users"
    }

getUsersAsync().Result |> printfn "Got users async: %A"

let getUser id =
    use conn = getConnection()
    let sql = "SELECT id, name FROM users WHERE id = @id"
    conn.QuerySingleOrDefault<User>(sql, {| id = id |}) |> Option.ofObj

getUser 1 |> printfn "Got user: %A"
getUser 100 |> printfn "Didn't get user: %A"

let getUserAsync id =
    task {
        use conn = getConnection()
        let sql = "SELECT id, name FROM users WHERE id = @id"
        let! result = conn.QuerySingleOrDefaultAsync<User>(sql, {| id = id |})
        return Option.ofObj result
    }

(getUserAsync 2).Result |> printfn "Got user async: %A"
(getUserAsync 200).Result |> printfn "Didn't get user async: %A"

let updateUser user =
    use conn = getConnection()
    let sql = "UPDATE users SET name = @Name WHERE id = @Id"
    conn.Execute(sql, user) = 1

let user =
    { Id   = 1
      Name = "Ritter" }
updateUser user |> printfn "User updated: %b"

let updateUserAsync user =
    task {
        use conn = getConnection()
        let sql = "UPDATE users SET name = @Name WHERE id = @Id"
        let! result = conn.ExecuteAsync(sql, user)
        return result = 1
    }

let userAsync =
    { Id   = 2
      Name = "R. R."}
(updateUserAsync userAsync).Result |> printfn "User updated async: %b"

let runTransaction userId =
    use conn = getConnection()
    conn.Open()
    use tx = conn.BeginTransaction IsolationLevel.Serializable
    try
        let user = conn.QuerySingleOrDefault<User>("SELECT id, name FROM users WHERE id = @id", {| id = userId |}, tx)
        let updateResult =
            if isNull (box user) then
                0
            else
                let updatedUser = { user with Name = user.Name + " (updated by transaction)" }
                conn.Execute("UPDATE users SET name = @Name WHERE id = @Id", updatedUser, tx)
        tx.Commit()
        Ok (updateResult = 1)
    with ex ->
        tx.Rollback()
        Error ex

runTransaction 1 |> printfn "Transaction completed: %A"
runTransaction 100 |> printfn "Transaction failed: %A"

let runTransactionAsync userId =
    task {
        use conn = getConnection()
        conn.Open()
        use tx = conn.BeginTransaction IsolationLevel.Serializable
        try
            let! user = conn.QuerySingleOrDefaultAsync<User>("SELECT id, name FROM users WHERE id = @id", {| id = userId |}, tx)
            let! updateResult =
                if isNull (box user) then
                    Task.FromResult 0
                else
                    let updatedUser = { user with Name = user.Name + " (updated by async transaction)" }
                    conn.ExecuteAsync("UPDATE users SET name = @Name WHERE id = @Id", updatedUser, tx)
            tx.Commit()
            return Ok (updateResult = 1)
        with ex ->
            tx.Rollback()
            return Error ex
    }

(runTransactionAsync 2).Result |> printfn "Async transaction completed: %A"
(runTransactionAsync 200).Result |> printfn "Async transaction failed: %A"