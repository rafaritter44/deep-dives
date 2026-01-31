module BasicFunctions =
    let f1 x = x*x + 3
    let result1 = f1 4573
    printfn $"result1: %d{result1}"

    let f2 (x:int) = 2*x*x - x/5 + 3
    let result2 = f2 (7 + 4)
    printfn $"result2: %d{result2}"

    let f3 x =
        if x < 100.0 then
            2.0*x*x - x/5.0 + 3.0
        else
            2.0*x*x + x/5.0 - 37.0
    let result3 = f3 (6.5 + 4.5)
    printfn $"result3: %f{result3}"

module Immutability =
    let number = 2
    printfn $"number: {number}"

    let mutable otherNumber = 2
    printfn $"otherNumber: {otherNumber}"
    otherNumber <- otherNumber + 1
    printfn $"otherNumber after mutation: {otherNumber}"

module IntegersAndNumbers =
    let int1 = 176
    printfn $"int1: {int1}"
    let aDouble = 4.1
    printfn $"aDouble: {aDouble}"
    let int2 = (int1/4 + 5 - 7) * 4 + int aDouble
    printfn $"int2: {int2}"

    let numbers = [ 0 .. 99 ]
    printfn $"numbers:\n{numbers}"
    let tableOfSquares = [ for i in 0 .. 99 -> (i, i*i) ]
    printfn $"tableOfSquares:\n{tableOfSquares}"

module Booleans =
    let bool1 = true
    let bool2 = false
    let bool3 = not bool1 && (bool2 || false)
    printfn $"bool3: %b{bool3}"

module StringManipulation =
    let str1 = "Hello"
    let str2 = "World"
    let helloWorld = str1 + ", " + str2 + "!"
    printfn "%s" helloWorld

    let substring = helloWorld[0..6]
    printfn $"{substring}"

    let str3 = @"C:\Program Files\"
    printfn $"{str3}"
    let str4 = """The computer said "hello world" when I told it to!"""
    printfn $"{str4}"

module Tuples =
    let tuple1 = (1, 2, 3)
    let tuple2 = (1, "hello", 3.1415)
    printfn $"tuple1: {tuple1}\ttuple2: {tuple2}"

    let swapElems (a, b) = (b, a)
    printfn $"The result of swapping (1, 2) is: {(swapElems (1,2))}"

    let structTuple = struct (1, 2)
    // let thisWillNotCompile: (int*int) = struct (1, 2)

    let convertFromStructTuple (struct(a, b)) = (a, b)
    printfn $"Struct tuple: {structTuple}\nReference tuple made from the struct tuple: {(structTuple |> convertFromStructTuple)}"
    let convertToStructTuple (a, b) = struct(a, b)
    printfn $"Reference tuple: {(1,2)}\nStruct tuple made from the reference tuple: {((1,2) |> convertToStructTuple)}"

module PipelinesAndComposition =
    let square x = x * x
    let addOne x = x + 1
    let isOdd x = x % 2 <> 0

    let numbers = [ 1; 2; 3; 4; 5 ]

    let squareOddValuesAndAddOne values =
        let odds = List.filter isOdd values
        let squares = List.map square odds
        let result = List.map addOne squares
        result
    printfn $"Processing {numbers} through 'squareOddValuesAndAddOne': {squareOddValuesAndAddOne numbers}"

    let squareOddValuesAndAddOneNested values =
        List.map addOne (List.map square (List.filter isOdd values))
    printfn $"Processing {numbers} through 'squareOddValuesAndAddOneNested': {squareOddValuesAndAddOneNested numbers}"

    let squareOddValuesAndAddOnePipeline values =
        values
        |> List.filter isOdd
        |> List.map square
        |> List.map addOne
    printfn $"Processing {numbers} through 'squareOddValuesAndAddOnePipeline': {squareOddValuesAndAddOnePipeline numbers}"

    let squareOddValuesAndAddOneShorterPipeline values =
        values
        |> List.filter isOdd
        |> List.map(fun x -> x |> square |> addOne)
    printfn $"Processing {numbers} through 'squareOddValuesAndAddOneShorterPipeline': {squareOddValuesAndAddOneShorterPipeline numbers}"

    let squareOddValuesAndAddOneComposition =
        List.filter isOdd >> List.map (square >> addOne)
    printfn $"Processing {numbers} through 'squareOddValuesAndAddOneComposition': {squareOddValuesAndAddOneComposition numbers}"

module Lists =
    let list1 = []
    let list2 = [1; 2; 3]
    let list3 = [
        1
        2
        3
    ]
    printfn $"Lists:\n{list1}\n{list2}\n{list3}"

    let numberList = [1..1000]
    let squares =
        numberList
        |> List.map (fun x -> x*x)
    printfn $"Squares: {squares}"
    let sumOfSquares =
        numberList
        |> List.filter (fun x -> x % 3 = 0)
        |> List.sumBy (fun x -> x * x)
    printfn $"Sum of squares of numbers divisible by 3 up to 1000: %d{sumOfSquares}"

    let daysList =
        [ for month in 1..12 do
            for day in 1..System.DateTime.DaysInMonth(2026, month) do
                yield System.DateTime(2026, month, day) ]
    printfn $"The first 5 days of 2026 are: {daysList |> List.take 5}"

    let blackSquares =
        [ for i in 0..7 do
            for j in 0..7 do
                if (i+j) % 2 = 1 then
                    yield (i, j) ]
    printfn $"Chess board black squares:\n{blackSquares}"

module Arrays =
    let array1 = [||]
    let array2 = [|"hello"; "world"; "and"; "hello"; "world"; "again"|]
    let array3 = [|1..1000|]
    let array4 =
        [| for word in array2 do
            if word.Contains("l") then
                yield word |]
    let evenNumbers = Array.init 1001 (fun n -> n * 2)
    let evenNumbersSlice = evenNumbers[0..500]
    array2[1] <- "WORLD!"
    printfn $"Arrays:\n%A{array1}\n%A{array2}\n%A{array3}\n%A{array4}\n%A{evenNumbers}\n%A{evenNumbersSlice}"

    for word in array4 do
        printfn $"Word: {word}"

    let sumOfLengthsOfWords =
        array2
        |> Array.filter (fun x -> x.StartsWith "h")
        |> Array.sumBy (fun x -> x.Length)
    printfn $"sumOfLengthsOfWords: %d{sumOfLengthsOfWords}"

module Sequences =
    let seq1 = Seq.empty
    let seq2 = seq { yield "hello"; yield "world"; yield "and"; yield "hello"; yield "world"; yield "again" }
    let seq3 =
        seq { for word in seq2 do
                if word.Contains("l") then
                    yield word }
    let seq4 = seq {1..1000}
    let seq5 = Seq.init 1001 (fun n -> n * 2)
    printfn $"Sequences:\n%A{seq1}\n%A{seq2}\n%A{seq3}\n%A{seq4}\n%A{seq5}"

    let rnd = System.Random()
    let rec randomWalk x =
        seq {
            yield x
            yield! randomWalk (x + rnd.NextDouble() - 0.5)
        }
    let first100ValuesOfRandomWalk =
        randomWalk 5.0
        |> Seq.truncate 100
        |> Seq.toList
    printfn $"first100ValuesOfRandomWalk: {first100ValuesOfRandomWalk}"

module RecursiveFunctions =
    let rec factorial n =
        if n = 0 then 1 else n * factorial (n-1)
    printfn $"Factorial of 6 is: %d{factorial 6}"

    let rec greatestCommonFactor a b =
        if a = 0 then b
        elif a < b then greatestCommonFactor a (b - a)
        else greatestCommonFactor (a - b) b
    printfn $"The greatest common factor of 300 and 620 is %d{greatestCommonFactor 300 620}"

    let rec sumList xs =
        match xs with
        | []    -> 0
        | y::ys -> y + sumList ys
    printfn $"The sum of 1-10 is: %d{sumList [1..10]}"

    let rec private sumListTailRecHelper accumulator xs =
        match xs with
        | []    -> accumulator
        | y::ys -> sumListTailRecHelper (accumulator+y) ys
    let sumListTailRecursive xs = sumListTailRecHelper 0 xs
    printfn $"The sum of 1-10 is: %d{sumListTailRecursive [1..10]}"

module RecordTypes =
    type ContactCard =
        { Name     : string
          Phone    : string
          Verified : bool }
    let contact1 =
        { Name = "Alf"
          Phone = "(206) 555-0157"
          Verified = false }
    let contactOnSameLine = { Name = "Alf"; Phone = "(206) 555-0157"; Verified = false }
    printfn $"Structural equality: {contact1 = contactOnSameLine}"

    let contact2 =
        { contact1 with
            Phone = "(206) 555-0112"
            Verified = true }
    printfn $"Record created by copy-and-update:\n{contact2}"

    let showContactCard (c: ContactCard) =
        c.Name + " Phone: " + c.Phone + (if not c.Verified then " (unverified)" else "")
    printfn $"Alf's contact card: {showContactCard contact1}"

    type ContactCardAlternate =
        { Name     : string
          Phone    : string
          Address  : string
          Verified : bool }
          member this.PrintedContactCard =
            this.Name + " Phone: " + this.Phone + (if not this.Verified then " (unverified) " else " ") + this.Address
    let contactAlternate =
        { Name = "Alf"
          Phone = "(206) 555-0157"
          Verified = false
          Address = "111 Alf Street" }
    printfn $"Alf's alternate contact card: {contactAlternate.PrintedContactCard}"

    [<Struct>]
    type ContactCardStruct = {
        Name : string
        Phone : string
        Verified : bool
    }
    let contactStruct = {
        Name = "Alf"
        Phone = "(206) 555-0157"
        Verified = false
    }
    printfn $"Alf's contact card struct:\n{contactStruct}"

module DiscriminatedUnions =
    type Suit =
        | Hearts
        | Clubs
        | Diamonds
        | Spades
    type Rank =
        | Value of int
        | Ace
        | King
        | Queen
        | Jack
        static member GetAllRanks() =
            [ yield Ace
              for i in 2..10 do yield Value i
              yield Jack
              yield Queen
              yield King ]
    type Card = { Suit: Suit; Rank: Rank }
    let fullDeck =
        [ for suit in [ Hearts; Diamonds; Clubs; Spades ] do
            for rank in Rank.GetAllRanks() do
                yield { Suit=suit; Rank=rank } ]
    let showPlayingCard (c: Card) =
        let rankString =
            match c.Rank with
            | Ace -> "Ace"
            | King -> "King"
            | Queen -> "Queen"
            | Jack -> "Jack"
            | Value n -> string n
        let suitString =
            match c.Suit with
            | Clubs -> "clubs"
            | Diamonds -> "diamonds"
            | Spades -> "spades"
            | Hearts -> "hearts"
        rankString + " of " + suitString
    let printAllCards() =
        for card in fullDeck do
            printfn $"{showPlayingCard card}"
    printAllCards()

module SingleCaseDiscriminatedUnions =
    type Address = Address of string
    type Name = Name of string
    type SSN = SSN of int

    let address = Address "111 Alf Way"
    let name = Name "Alf"
    let ssn = SSN 1234567890

    let unwrapAddress (Address a) = a
    let unwrapName (Name n) = n
    let unwrapSSN (SSN s) = s

    printfn $"Address: {address |> unwrapAddress}, Name: {name |> unwrapName}, and SSN: {ssn |> unwrapSSN}"

module RecursiveDiscriminatedUnions =
    type BST<'T> =
        | Empty
        | Node of value:'T * left: BST<'T> * right: BST<'T>
    let rec exists item bst =
        match bst with
        | Empty -> false
        | Node (x, left, right) ->
            if item = x then true
            elif item < x then (exists item left)
            else (exists item right)
    let rec insert item bst =
        match bst with
        | Empty -> Node (item, Empty, Empty)
        | Node (x, left, right) as node ->
            if item = x then node
            elif item < x then Node (x, insert item left, right)
            else Node (x, left, insert item right)

    let tree = Empty
    let tree1 = insert 10 tree
    let tree2 = insert 5 tree1
    let tree3 = insert 15 tree2
    printfn $"{exists 5 tree3}\n{exists 15 tree3}\n{exists 7 tree3}"

module PatternMatching =
    type Person = {
        First : string
        Last  : string
    }
    type Employee =
        | Engineer of engineer: Person
        | Manager of manager: Person * reports: List<Employee>
        | Executive of executive: Person * reports: List<Employee> * assistant: Employee
    let rec countReports(emp : Employee) =
        1 + match emp with
            | Engineer(person) ->
                0
            | Manager(person, reports) ->
                reports |> List.sumBy countReports
            | Executive(person, reports, assistant) ->
                (reports |> List.sumBy countReports) + countReports assistant

    let alice = { First = "Alice"; Last = "A." }
    let bob = { First = "Bob"; Last = "B." }
    let charlie = { First = "Charlie"; Last = "C." }
    let david = { First = "David"; Last = "D." }
    let eve = { First = "Eve"; Last = "E." }
    let frank = { First = "Frank"; Last = "F." }

    let eng1 = Engineer alice
    let eng2 = Engineer bob
    let eng3 = Engineer charlie
    let eng4 = Engineer david

    let mgr = Manager(eve, [ eng1; eng2 ])

    let exec = Executive(frank, [mgr; eng3], eng4)

    printfn $"Manager reports: {countReports mgr}"
    printfn $"Executive reports: {countReports exec}"

    let findGraceWithOpenPosition(emps : List<Employee>) =
        emps
        |> List.filter(function
                       | Manager({First = "Grace"}, []) -> true
                       | Executive({First = "Grace"}, [], _) -> true
                       | _ -> false)
    let emps = [eng1; eng2; eng3; eng4; mgr; exec]
    let grace = { First = "Grace"; Last = "G." }
    printfn $"{findGraceWithOpenPosition (Engineer grace :: emps)}"
    printfn $"{findGraceWithOpenPosition (Manager(grace, []) :: emps)}"
    printfn $"""{findGraceWithOpenPosition (Executive(grace, [], Engineer { First = "Heidi"; Last = "H."}) :: emps)}"""

    let private parseHelper (f: string -> bool * 'T) = f >> function
        | true, item -> Some item
        | false, _ -> None
    let parseDateTimeOffset = parseHelper System.DateTimeOffset.TryParse
    let result = parseDateTimeOffset "1970-01-01"
    match result with
    | Some dto -> printfn $"It parsed! {dto}"
    | None -> printfn "It didn't parse!"

    let parseInt = parseHelper System.Int32.TryParse
    let parseDouble = parseHelper System.Double.TryParse
    let parseTimeSpan = parseHelper System.TimeSpan.TryParse

    let (|Int|_|) = parseInt
    let (|Double|_|) = parseDouble
    let (|Date|_|) = parseDateTimeOffset
    let (|TimeSpan|_|) = parseTimeSpan

    let printParseResult = function
        | Int x -> printfn $"%d{x}"
        | Double x -> printfn $"%f{x}"
        | Date d -> printfn $"%O{d}"
        | TimeSpan t -> printfn $"%O{t}"
        | _ -> printfn "Nothing was parsable!"

    printParseResult "12"
    printParseResult "12.045"
    printParseResult "19/01/2026"
    printParseResult "9:01PM"
    printParseResult "banana!"

module OptionValues =
    type ZipCode = ZipCode of string
    type Customer = { ZipCode: ZipCode option }
    type IShippingCalculator =
        abstract GetState : ZipCode -> string option
        abstract GetShippingZone : string -> int
    let CustomerShippingZone (calculator: IShippingCalculator, customer: Customer) =
        customer.ZipCode
        |> Option.bind calculator.GetState
        |> Option.map calculator.GetShippingZone

    type ShippingCalculator() =
        interface IShippingCalculator with
            member _.GetState (ZipCode zip) =
                match zip with
                | z when z.StartsWith "90" -> Some "CA"
                | z when z.StartsWith "10" -> Some "NY"
                | _ -> None
            member _.GetShippingZone state =
                match state with
                | "CA" -> 1
                | "NY" -> 2
                | _ -> 99
    let calculator = ShippingCalculator() :> IShippingCalculator

    let customerWithZip = { ZipCode = Some (ZipCode "90210") }
    let customerWithoutZip = { ZipCode = None }
    let customerWithUnknownZip = { ZipCode = Some (ZipCode "00000") }

    let zone1 = CustomerShippingZone(calculator, customerWithZip)
    let zone2 = CustomerShippingZone(calculator, customerWithoutZip)
    let zone3 = CustomerShippingZone(calculator, customerWithUnknownZip)
    printfn $"%A{zone1}\n%A{zone2}\n%A{zone3}"

module UnitsOfMeasure =
    open Microsoft.FSharp.Data.UnitSystems.SI.UnitNames

    let val1 = 1600.0<meter>

    [<Measure>]
    type mile = static member asMeter = 1609.34<meter/mile>

    let val2 = 500.0<mile>
    let val3 = val2 * mile.asMeter

    printfn $"After a %.2f{val1} race, I would walk %.2f{val2} miles, which would be %.2f{val3} meters."

module DefiningClasses =
    type Vector2D(dx : double, dy : double) =
        let length = sqrt (dx*dx + dy*dy)
        member _.DX = dx
        member _.DY = dy
        member _.Length = length
        member this.Scale(k) = Vector2D(k * this.DX, k * this.DY)
    let vector1 = Vector2D(3.0, 4.0)
    let vector2 = vector1.Scale 10.0
    printfn $"Length of vector1: %.2f{vector1.Length}\nLength of vector2: %.2f{vector2.Length}"

module DefiningGenericClasses =
    type StateTracker<'T>(initialElement: 'T) =
        let mutable states = [ initialElement ]
        member this.UpdateState newState =
            states <- newState :: states
        member this.History = states
        member this.Current = states.Head
    let tracker = StateTracker 10
    tracker.UpdateState 17
    printfn $"Current: {tracker.Current}"
    printfn $"History: {tracker.History}"