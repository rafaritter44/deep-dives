(*
If there is only one module in a file, the module name can be declared at the top,
and all code constructs within the file will be included in the module's definition
(no indentation required).
*)
module Functions

let sumOfSquares n = seq {1..n} |> Seq.sumBy (fun x -> x * x) // Functions.sumOfSquares

module SubModule =
    let add a b = a + b