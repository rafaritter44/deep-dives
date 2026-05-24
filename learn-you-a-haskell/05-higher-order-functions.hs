-- Curried functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

multTwoWithNine :: Int -> Int -> Int
multTwoWithNine = multThree 9

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

    -- Higher-order functions

    -- Maps and filters

    -- Lambdas

    -- Folds

    -- Function application with $

    -- Function composition