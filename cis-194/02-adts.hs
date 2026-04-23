data Thing = Shoe
           | Ship
           | SealingWax
           | Cabbage
           | King
    deriving Show

shoe :: Thing
shoe = Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

isSmall :: Thing -> Bool
isSmall Shoe       = True
isSmall Ship       = False
isSmall SealingWax = True
isSmall Cabbage    = True
isSmall King       = False

isSmall2 :: Thing -> Bool
isSmall2 Ship = False
isSmall2 King = False
isSmall2 _    = True

data FailableDouble = Failure
                    | OK Double
    deriving Show

ex01 :: FailableDouble
ex01 = Failure
ex02 :: FailableDouble
ex02 = OK 3.4

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d)  = d

data Person = Person String Int Thing
    deriving Show

brent :: Person
brent = Person "Brent" 31 SealingWax

stan :: Person
stan = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a

data AlgDataType = Constr1 Int Int
                 | Constr2 String
                 | Constr3 Int Double String
                 | Constr4
    deriving Show

algDataTypes :: [AlgDataType]
algDataTypes = [Constr1 1 2, Constr2 "str", Constr3 1 2.5 "str", Constr4]

foo :: AlgDataType -> String
foo (Constr1 x y)   = show [x, y]
foo (Constr2 a)     = a
foo (Constr3 a b c) = show (a, b, c)
foo Constr4         = "Constr4"

baz :: Person -> String
baz p@(Person n _ _) = "The name of (" ++ show p ++ ") is " ++ n

checkFav :: Person -> String
checkFav (Person n _ SealingWax) = n ++ ", you're my kind of person!"
checkFav (Person n _ _)          = n ++ ", your favorite thing is lame."

ex03 :: Int
ex03 = case "Hello" of
            []      -> 3
            ('H':s) -> length s
            _       -> 7

main :: IO ()
main = do
    print shoe
    print listO'Things
    print (map isSmall listO'Things)
    print (map isSmall2 listO'Things)
    print (ex01, ex02)
    print (safeDiv 3 2, safeDiv 1 0)
    print (failureToZero ex01, failureToZero ex02)
    print (map getAge [brent, stan])
    print algDataTypes
    print (map foo algDataTypes)
    print (map baz [brent, stan])
    print (map checkFav [brent, stan])
    print ex03