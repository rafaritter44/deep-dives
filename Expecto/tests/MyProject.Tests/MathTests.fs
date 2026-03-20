module MyProject.Tests.MathTests

open Expecto
open MyProject.Math

let tests =
    let expected = 4
    let message = "2+2 = 4"
    testList "A test list" [
        // Tests
        test "A test" {
            let actual = add 2 2
            Expect.equal actual expected message
        }
        testAsync "An async test" {
            let! actual = async { return add 2 2 }
            Expect.equal actual expected message
        }
        testTask "A task test" {
            let! actual = task { return add 2 2 }
            Expect.equal actual expected message
        }

        // Test cases
        testCase "A test case" <| fun () ->
            let actual = add 2 2
            Expect.equal actual expected message
        testCaseAsync "An async test case" <| async {
            let! actual = async { return add 2 2 }
            Expect.equal actual expected message
        }
        testCaseTask "A task test case" <| fun () ->
            task {
                let! actual = task { return add 2 2 }
                Expect.equal actual expected message
            }

        // Test theories
        testTheory "A test theory" [(1,1),2; (2,2),4] <| fun ((a,b), expected) ->
            let actual = add a b
            Expect.equal actual expected message
    ]