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

module UnitType =
    let getCurrentDateTime () = System.DateTime.Now
    let currentDateTime = getCurrentDateTime()
    printfn $"{currentDateTime}"

module ExplicitTyping =
    let countWordsStartingWithLetter (theString: string) (theLetter: char) : int =
        theString.Split ' '
        |> Seq.where (fun (word: string) -> word.StartsWith theLetter)  // explicit typing in a lambda
        |> Seq.length
    printfn $"""{countWordsStartingWithLetter "test this string" 't'}"""

    let anonRecordFunc (record: {| Count: int; LeftAndRight: bigint * bigint |}) =
        printfn $"{record}"
    anonRecordFunc {| Count = 1; LeftAndRight = 10I, 20I |}

module RecursiveFunctions =
    [<TailCall>]
    let rec fact x =
        if x < 1 then 1
        else x * fact (x - 1)
    printfn $"{fact 10}"