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

    let rec sumEachItem (list: int list) =
        match list with
        | [] -> 0
        | head :: tail -> head + sumEachItem tail
    printfn $"{sumEachItem [1; 2; 3]}"

    let rec sumEachItem2 = function
        | [] -> 0
        | head :: tail -> head + sumEachItem2 tail
    printfn $"{sumEachItem2 [1; 2; 3]}"

module CollectionComprehension =
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

module Tuples =
    // Construction
    let numberAndWord = (1, "Hello")
    let numberAndWordAndNow = (1, "Hello", System.DateTime.Now)

    // Deconstruction
    let (number, word) = numberAndWord
    let (_, _, now) = numberAndWordAndNow
    printfn $"{number},{word},{now}"

    // fst and snd functions for two-item tuples
    printfn $"{fst numberAndWord},{snd numberAndWord}"

    // Pattern matching
    let printNumberAndWord = function
        | 1, word -> printfn $"One: %s{word}"
        | 2, word -> printfn $"Two: %s{word}"
        | _, word -> printfn $"Number: %s{word}"
    printNumberAndWord numberAndWord

    // Function parameter deconstruction
    let printNumberAndWord' (number, word) = printfn $"%d{number}: %s{word}"
    printNumberAndWord' numberAndWord

    // C# out parameter
    let success, outParsedDateTime = System.DateTime.TryParse "2026/09/13"
    printfn $"{success},{outParsedDateTime}"
    printfn $"""{System.DateTime.TryParse "invalid"}"""

module DiscriminatedUnions =
    type Interaction =
        | MouseClick of countOfClicks: int
        | Keyboard of char
        | KeyboardWithModifier of char * modifier: System.ConsoleModifiers
    let interaction1 = MouseClick 1
    let interaction2 = MouseClick (countOfClicks = 2)
    let interaction3 = KeyboardWithModifier ('c', System.ConsoleModifiers.Control)
    let interactionToString = function
        | Keyboard chr -> $"Character: {chr}"
        | KeyboardWithModifier (chr, modifier) -> $"Character: {modifier}+{chr}"
        | MouseClick (countOfClicks = 1) -> "Click"
        | MouseClick (countOfClicks = x) -> $"Clicked: {x}"
    [ interaction1; interaction2; interaction3 ] |> List.iter (interactionToString >> printfn "%s")

    let resultPatternMatch = function
        | Ok value -> $"Input: %.2f{value}"
        | Error msg -> $"Error: %s{msg}"
    printfn $"""{resultPatternMatch (Ok 10.0)}; {resultPatternMatch (Error "An error occurred")}"""

    let divide x y =
        if y = 0.0 then
            Error "Cannot divide by zero"
        else
            Ok (x/y)
    let printDivisionResult x y = divide x y |> (resultPatternMatch >> printfn "%s")
    printDivisionResult 15 2
    printDivisionResult 15 0

    type OrderId = Order of string
    let orderId = Order "12"
    let (Order id) = orderId
    printfn $"Order ID: {id}"

module PatternMatching =
    let intValue = 2
    let result =
        match intValue with
        | 0 -> "Zero"
        | 1 | 2 -> "One or Two"
        | x -> $"Something else: {x}"
    printfn $"{result}"

    let tupleValue = 2, 3
    let result' =
        match tupleValue with
        | (_, 3) & (x, y) -> $"{x}, 3"
        | _ -> "Wildcard"
    printfn $"{result'}"

    let num = -5
    let result'' =
        match num with
        | 0 -> 0
        | x when x < 0 -> -1
        | x -> 1
    printfn $"{result''}"

module Exceptions =
    exception MyException of int * string
    let tryWith guard number =
        try
            match number with
            | 1 -> failwith "Message"
            | 2 -> nullArg "ArgumentName"
            | 3 -> invalidArg "ArgumentName" "Message"
            | 4 -> invalidOp "Message"
            | 5 -> raise(System.NotImplementedException "Message")
            | 6 -> raise(MyException (0, "Message"))
            | _ -> true
        with
        | :? System.ArgumentNullException -> printfn "NullException"; false
        | :? System.ArgumentException as ex -> printfn $"{ex.Message}"; false
        | :? System.InvalidOperationException as ex when guard -> printfn $"{ex.Message}"; reraise()
        | MyException(num, str) when guard -> printfn $"{num}, {str}"; false
        | MyException(num, str) -> printfn $"{num}, {str}"; reraise()
        | ex when guard -> printfn $"{ex.Message}"; false
        | ex -> printfn $"{ex.Message}"; false
    [1; 2; 3; 5; 6; 0] |> List.iter (tryWith true >> printfn "%b")

    exception InnerError of string
    exception OuterError of string
    let handleErrors x y =
        try
            try
                if x = y then raise (InnerError "inner")
                else raise (OuterError "outer")
            with
            | InnerError str -> printfn "Error1 %s" str
        finally
            printfn "Always print this"
    handleErrors 1 1

module Classes =
    type Vector(x: float, y: float) =
        let mag = sqrt(x * x + y * y)
        member _.X = x
        member _.Y = y
        member _.Mag = mag
        member _.Scale s =
            Vector(x * s, y * s)
        static member (+) (a : Vector, b : Vector) =
            Vector(a.X + b.X, a.Y + b.Y)
    let v1 = Vector(1.0, 2.0)
    let v2 = v1.Scale 10
    let v3 = v1 + v2
    printfn $"{v3.Mag}"

module Interfaces =
    type IVector =
        abstract Scale : float -> IVector
    type Vector(x, y) =
        interface IVector with
            member _.Scale s =
                Vector(x * s, y * s) :> IVector
        member _.X = x
        member _.Y = y
    let v1 = Vector(1.0, 2.0) :> IVector
    let v2 = v1.Scale 10 :?> Vector
    printfn $"X: {v2.X}; Y: {v2.Y}"

    // Object expression
    type ICustomer =
        abstract Name : string
        abstract Age : int
    let createCustomer name age =
        { new ICustomer with
            member _.Name = name
            member _.Age = age }
    let customer = createCustomer "Rafael" 30
    printfn $"{customer.Name} {customer.Age}"

module ActivePatterns =
    open System.Text.RegularExpressions
    let (|EmailDomain|) email =
        let match' = Regex.Match(email, "@(.*)$")
        if match'.Success
        then match'.Groups[1].ToString()
        else ""
    let (EmailDomain emailDomain) = "ritter@email.com"
    let (EmailDomain emailDomain') = "invalid"
    printfn $"Valid email domain: {emailDomain}\nInvalid email domain: {emailDomain'}"

    open System.Numerics
    let (|RealAndImaginary|) (x: Complex) =
        x.Real, x.Imaginary
    let addReal (RealAndImaginary (real1, _)) (RealAndImaginary (real2, _)) =  // conversion done in the parameters
        real1 + real2
    let addRealOut = addReal Complex.ImaginaryOne Complex.ImaginaryOne
    printfn $"{addRealOut}"

    let (|Default|) onNone value =
        match value with
        | None -> onNone
        | Some e -> e
    let (Default "random citizen" name) = None
    let (Default "random citizen" name') = Some "Steve"
    printfn $"{name}\n{name'}"

    let (|Even|Odd|) i =
        if i % 2 = 0 then Even else Odd
    let testNumber i =
        match i with
        | Even -> printfn "%d is even" i
        | Odd -> printfn "%d is odd" i
    testNumber 100
    testNumber 101

    let (|Phone|Email|) (s:string) =
        if s.Contains '@' then Email $"Email: {s}" else Phone $"Phone: {s}"
    match "ritter@email.com" with
    | Email email -> printfn $"{email}"
    | Phone phone -> printfn $"{phone}"

    let (|DivisibleBy|_|) by n =
        if n % by = 0
        then Some DivisibleBy
        else None
    let fizzBuzz = function
        | DivisibleBy 3 & DivisibleBy 5 -> "FizzBuzz"
        | DivisibleBy 3 -> "Fizz"
        | DivisibleBy 5 -> "Buzz"
        | i -> string i
    [0..10] |> List.iter (fizzBuzz >> printfn "%s")

module DotNetTasks =
    open System.Threading.Tasks
    let readFile filename ct = task {
        printfn "Started reading task"
        do! Task.Delay(1500, cancellationToken = ct)
        let! text = System.IO.File.ReadAllTextAsync(filename, ct)
        return text
    }
    let readFileTask = readFile "myfile.txt" System.Threading.CancellationToken.None
    let fileContent = readFileTask.Result // Blocks thread and waits for content.
    printfn $"{fileContent}"
    let fileContent' = readFileTask.Result // Task is already completed. Returns same value immediately. No output.
    printfn $"{fileContent'}"

    let loop (token: System.Threading.CancellationToken) = task {
        for cnt in [ 0 .. 9 ] do
            printf $"{cnt}: And..."
            do! Task.Delay(1000, token)
            printfn "Done"
    }
    let cts = new System.Threading.CancellationTokenSource 2500
    let runningLoop = loop cts.Token
    try
        runningLoop.GetAwaiter().GetResult()
    with :? System.OperationCanceledException -> printfn "Canceled"

module AsyncComputations =
    let readFile filename = async {
        do! Async.Sleep 1500
        let! text = System.IO.File.ReadAllTextAsync filename |> Async.AwaitTask
        printfn "Finished reading file"
        return text
    }
    let readFiles = [ readFile "A"; readFile "B" ] |> Async.Parallel
    let textOfFiles = readFiles |> Async.RunSynchronously // execute async computation
    Array.iter (printfn "%s") textOfFiles
    let textOfFiles' = readFiles |> Async.RunSynchronously // execute async computation again
    Array.iter (printfn "%s") textOfFiles'

    open System.Threading.Tasks
    let loop = async {
        for cnt in [ 0 .. 9 ] do
            printf $"{cnt}: And..."

            do! Async.Sleep 500 // Async.Sleep implicitly receives and checks cts.Token

            // when interoperating with Tasks, cancellationTokens need to be passed explicitly
            let! ct = Async.CancellationToken
            do! Task.Delay(500, cancellationToken = ct) |> Async.AwaitTask

            printfn "Done"
    }
    let cts = new System.Threading.CancellationTokenSource 2500
    try
        Async.RunSynchronously (loop, System.Threading.Timeout.Infinite, cts.Token)
    with :? System.OperationCanceledException -> printfn "Canceled"

module Modules =
    Functions.sumOfSquares 10 |> printfn "%d"
    Functions.SubModule.add 1 2 |> printfn "%d"

    module Money =
        type CardInfo =
            { number: string
              expiration: int * int }
        type Payment =
            | Card of CardInfo
            | Cash of int
        module Functions =
            let validCard (cardNumber: string) =
                cardNumber.Length = 16 && (cardNumber[0], ['3';'4';'5';'6']) ||> List.contains
            let processPayment = function
                | Cash amount -> printfn $"Paid ${amount} with cash."
                | Card card -> printfn $"Valid card? {validCard card.number}."
    let validCard : Money.CardInfo =
        { number = "6543210123456789"
          expiration = 12, 2027 }
    Money.Functions.processPayment (Money.Card validCard)
    open Money
    let invalidCard =
        { number = "1234567890123456"
          expiration = 12, 2027 }
    Functions.processPayment (Card invalidCard)
    Functions.processPayment (Cash 100)

module Namespaces =
    MyNamespace.SubNamespace.Functions.addAndPrint 1 2
    open MyNamespace
    SubNamespace.Functions.addAndPrint 10 20
    open MyNamespace.SubNamespace
    Functions.addAndPrint 100 200
    open MyNamespace.SubNamespace.Functions
    addAndPrint 1000 2000
    open MyNamespace.SubNamespace.Functions.SubModule
    subtractAndPrint 1 2

    printfn $"{MyModule.myLet}"
    printfn $"{My2ndModule.myLet}"
    printfn $"{MyNewNamespace.My3rdModule.myLet}"

module Open =
    module Groceries =
        type Fruit =
            | Apple
            | Banana
    let fruit1 = Groceries.Apple
    open Groceries // module
    let fruit2 = Banana
    printfn $"{fruit1}; {fruit2}"

    open System.Diagnostics  // namespace
    let stopwatch = Stopwatch.StartNew() // Stopwatch is accessible
    stopwatch.Stop()
    printfn $"{stopwatch.Elapsed}"