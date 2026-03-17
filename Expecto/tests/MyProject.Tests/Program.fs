open Expecto

let tests =
    testList "A test list" [
        test "A test" {
            let actual = 2+2
            let expected = 4
            let message = "2+2 = 4"
            Expect.equal actual expected message
        }

        testCase "A test case" <| fun () ->
            let actual = 2+2
            let expected = 4
            let message = "2+2 = 4"
            Expect.equal actual expected message
    ]

[<EntryPoint>]
let main args =
  runTestsWithCLIArgs [] args tests