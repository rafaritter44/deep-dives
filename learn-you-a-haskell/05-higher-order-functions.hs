-- Curried functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

multTwoWithNine :: Int -> Int -> Int
multTwoWithNine = multThree 9

multWithEighteen :: Int -> Int
multWithEighteen = multTwoWithNine 2

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

-- Higher-order functions

-- Maps and filters

-- Lambdas

-- Folds

-- Function application with $

-- Function composition

main :: IO ()
main = do
    -- Curried functions
    print $ (max 4) (5 :: Int)
    print $ multTwoWithNine 2 3
    print $ multWithEighteen 10
    print $ compareWithHundred (99 :: Int)

    -- Higher-order functions

    -- Maps and filters

    -- Lambdas

    -- Folds

    -- Function application with $

    -- Function composition