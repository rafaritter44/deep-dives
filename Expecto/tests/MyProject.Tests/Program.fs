open Expecto

let tests =
    let expected = 4
    let message = "2+2 = 4"
    testList "A test list" [
        test "A test" {
            let actual = 2+2
            Expect.equal actual expected message
        }
        testCase "A test case" <| fun () ->
            let actual = 2+2
            Expect.equal actual expected message
        testAsync "An async test" {
            let! actual = async { return 2+2 }
            Expect.equal actual expected message
        }
        testTask "A task test" {
            let! actual = task { return 2+2 }
            Expect.equal actual expected message
        }
    ]

[<EntryPoint>]
let main args =
  runTestsWithCLIArgs [] args tests