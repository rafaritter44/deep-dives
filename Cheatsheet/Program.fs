module AnonymousFunctions =
    let isDescending xs =
        xs
        |> List.pairwise
        |> List.forall (fun (x, y) -> x > y)
    printfn $"{isDescending [3; 2; 1]}"
    printfn $"{isDescending [3; 2; 1; 2]}"