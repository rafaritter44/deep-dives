module MyNamespace.SubNamespace.Functions

let addAndPrint a b = a + b |> printfn "%d"

module SubModule =
    let subtractAndPrint a b = a - b |> printfn "%d"