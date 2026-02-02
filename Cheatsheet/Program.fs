module AnonymousFunctions =
    let isDescending xs =
        xs
        |> List.pairwise
        |> List.forall (fun (x, y) -> x > y)