module MyProject.Tests.Program

open Expecto

let allTests =
    testList "All tests" [
        MathTests.tests
    ]

[<EntryPoint>]
let main args =
  runTestsWithCLIArgs [] args allTests