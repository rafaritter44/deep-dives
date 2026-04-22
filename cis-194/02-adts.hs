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

main :: IO ()
main = do
    print shoe
    print listO'Things
    print (map isSmall listO'Things)
    print (map isSmall2 listO'Things)
    print (ex01, ex02)
    print (safeDiv 3 2, safeDiv 1 0)
    print (failureToZero ex01, failureToZero ex02)