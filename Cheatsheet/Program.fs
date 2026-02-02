module AnonymousFunctions =
    let isDescending xs =
        xs
        |> List.pairwise
        |> List.forall (fun (x, y) -> x > y)
    printfn $"{isDescending [3; 2; 1]}"
    printfn $"{isDescending [3; 2; 1; 2]}"

    type Person = { Age : int }
    let records = seq { yield { Age = 30 }; yield { Age = 150 } }
    let suspiciousRecords =
        records
        |> Seq.filter (fun x -> x.Age >= 150)