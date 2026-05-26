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

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f y x = f x y

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
    print $ applyTwice (++ " HAHA") "HEY"
    print $ applyTwice ("HAHA " ++) "HEY"
    print $ applyTwice (multThree 2 2) (9 :: Int)
    print $ applyTwice (3:) [1 :: Int]
    print $ zipWith' (+) [4,2,5,6] ([2,6,2,3] :: [Int])
    print $ zipWith' max [6,3,2,1] ([7,3,1,5] :: [Int])
    print $ zipWith' (++) ["a-", "b-", "c-"] ["1", "2", "3"]
    print $ zipWith' (*) (replicate 5 2) ([1..] :: [Int])
    print $ zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] ([[3,2,2],[3,4,5],[5,4,3]] :: [[Int]])
    print $ flip' (++) "a" "b"
    print $ flip'' (++) "a" "b"
    print $ flip' zip ([1,2,3,4,5] :: [Int]) "hello"
    print $ zipWith (flip' div) ([2,2..] :: [Int]) [10,8,6,4,2]

    -- Maps and filters

    -- Lambdas

    -- Folds

    -- Function application with $

    -- Function composition