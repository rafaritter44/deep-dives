module MyProject.Program

open MyProject.Math

[<EntryPoint>]
let main _ =
    printfn "%d" <| add 2 2
    0