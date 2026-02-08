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

    [<TailCall>]
    let rec factTail acc x =
        if x < 1 then acc
        else factTail (acc * x) (x - 1)
    let factTail1 = factTail 1
    printfn $"{factTail1 10}"

    let factTail2 x =
        let rec factTail2Helper acc x =
            if x < 1 then acc
            else factTail2Helper (acc * x) (x - 1)
        factTail2Helper 1 x
    printfn $"{factTail2 10}"

    let rec even x =
        if x = 0 then true
        else odd (x - 1)
    and odd x =
        if x = 0 then false
        else even (x - 1)
    printfn $"{even 100}\n{even 101}\n{odd 100}\n{odd 101}"

module StaticallyResolvedTypeParameters =
    let inline add x y = x + y
    let integerAdd = add 1 2
    let floatAdd = add 1.0f 2.0f
    printfn $"%d{integerAdd}\n%.1f{floatAdd}"

    type RequestA = { Id: string; StringValue: string }
    type RequestB = { Id: string; IntValue: int }
    let requestA: RequestA = { Id = "A"; StringValue = "Value" }
    let requestB: RequestB = { Id = "B"; IntValue = 42 }
    let inline getId<'T when 'T : (member Id: string)> (x: 'T) = x.Id
    let idA = getId requestA
    let idB = getId requestB
    printfn $"{idA}\n{idB}"

module Lists =
    let list1 = [1..2..9]
    let list2 = [10..20..90]
    let list3 = list1 @ list2
    printfn $"{list3}"

    let matchList = function
        | [] -> "empty"
        | [ 3 ] -> "single item (3)"
        | [ _; 4 ] -> "two items (second item is 4)"
        | head :: tail -> $"head: {head}; tail: {tail}"
    printfn $"{matchList []}\n{matchList [ 3 ]}\n{matchList [ -1; 4 ]}\n{matchList [1; 2; 3]}"

    [<TailCall>]
    let rec sumEachItem (list: int list) =
        match list with
        | [] -> 0
        | head :: tail -> head + sumEachItem tail
    printfn $"{sumEachItem [1; 2; 3]}"

    [<TailCall>]
    let rec sumEachItem2 = function
        | [] -> 0
        | head :: tail -> head + sumEachItem2 tail
    printfn $"{sumEachItem2 [1; 2; 3]}"

    let listComprehension = [ for i in 0..4 -> 2 * i + 1 ]
    listComprehension |> List.iter (printf "%A;")
    printfn ""

    // yield is optional in a do, but is being used explicitly here
    let comprehendedList = [
        for i in 0..4 do
            yield 2 * i + 1
        ]
    let comprehendedArray = [|
        for i in 0..4 do
            yield 2 * i + 1
        yield! comprehendedList
        |]
    let comprehendedSequence = seq {
        let rnd = System.Random()
        while rnd.Next(0, 5) > 0 do
            comprehendedArray
        }
    comprehendedSequence |> Seq.iter (printf "%A;")
    printfn ""