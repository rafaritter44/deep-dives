module AnonymousFunctions =
    let isDescending xs =
        xs
        |> List.pairwise
        |> List.forall (fun (x, y) -> x > y)
    printfn $"{isDescending [3; 2; 1]}"
    printfn $"{isDescending [3; 2; 1; 2]}"

    type Person = { Name: string; Age : int }
    let records = seq { yield { Name = "Young"; Age = 30 }; yield { Name = "Old"; Age = 150 } }
    let suspiciousRecords =
        records
        |> Seq.filter (fun x -> x.Age >= 150)
    printfn $"%A{suspiciousRecords}"

    // _.Property shorthand
    let people = Seq.toList records
    let names =
        people
        |> List.map (fun person -> person.Name)
    let names' =
        people
        |> List.map _.Name
    let uppercaseNames =
        people |> List.map _.Name.ToUpperInvariant()
    printfn $"{names}\n{names'}\n{uppercaseNames}"