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
        testTheoryAsync "An async test theory" [(1,1),2; (2,2),4] <| fun ((a,b), expected) ->
            async {
                let! actual = async { return add a b }
                Expect.equal actual expected message
            }
        testTheoryTask "A task test theory" [(1,1),2; (2,2),4] <| fun ((a,b), expected) ->
            task {
                let! actual = async { return add a b }
                Expect.equal actual expected message
            }

        // Pending test
        ptest "A pending test" {
            failtest "This test is not implemented yet."
        }

        // Property-based tests
        testProperty "A test property" <| fun a b ->
            add a b = add b a
        testPropertyWithConfig { FsCheckConfig.defaultConfig with maxTest = 10000 } "A test property with config" <|
            fun a b c->
                multiply a (add b c) = add (multiply a b) (multiply a c)

        // Expectations
        test "A test with many expectations" {
            // Exception expectations
            let divideByZero () = divide 1 0 |> ignore
            let divideByZeroMsg = "Division by zero should throw."
            Expect.throws divideByZero divideByZeroMsg
            Expect.throwsT<System.DivideByZeroException> divideByZero divideByZeroMsg
            let divideByZeroExnMsg = Expect.throwsC divideByZero (fun exn -> exn.Message)
            Expect.equal divideByZeroExnMsg "Attempted to divide by zero." divideByZeroMsg

            // Quantifiers
            let isPositive n = n > 0
            Expect.exists [-1; 0; 1] isPositive "There is some positive number."
            Expect.all [1; 2; 3] isPositive "All numbers are positive."
            Expect.allEqual [0; 0; 0] 0 "All numbers are equal to zero."

            // Sequence expectations
            Expect.sequenceEqual [1; 2] [|1; 2|] "The values in these sequences are the same."
            Expect.sequenceStarts [1; 2; 3] [|1; 2|] "This sequence starts with the given prefix."
            Expect.sequenceContainsOrder [1; 2; 3; 4; 5] [|2; 4; 5|] "This sequence contains these elements in the given order."
            Expect.isAscending [1; 2; 2; 3] "This sequence is ascending."
            Expect.isDescending [3; 2; 2; 1] "This sequence is descending."

            // String expectations
            Expect.stringContains "abcdef" "bcd" "This string contains the given substring."
            Expect.stringStarts "abcdef" "abc" "This string starts with the given prefix."
            Expect.stringEnds "abdef" "def" "This string ends with the given suffix."
            Expect.stringHasLength "abcdef" 6 "This string has the given length."
            Expect.isNotEmpty " " "This string is not empty."

            // Float comparison
            Expect.floatClose Accuracy.low 2.001 2.002 "These floats are close enough."
        }
    ]