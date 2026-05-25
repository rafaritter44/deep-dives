-- Curried functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

multTwoWithNine :: Int -> Int -> Int
multTwoWithNine = multThree 9

multWithEighteen :: Int -> Int
multWithEighteen = multTwoWithNine 2

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

compareWithHundred' :: (Num a, Ord a) => a -> Ordering
compareWithHundred' = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- Higher-order functions

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

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
    print $ compareWithHundred' (99 :: Int)
    print $ divideByTen (200 :: Float)
    print $ isUpperAlphanum 'R'

    -- Higher-order functions
    print $ applyTwice (+3) (10 :: Int)

    -- Maps and filters

    -- Lambdas

    -- Folds

    -- Function application with $

    -- Function composition