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

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter' p xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter' (<=x) xs)
        biggerSorted = quicksort (filter' (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n    = n:chain (n `div` 2)
    | otherwise = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain ([1..100] :: [Int])))
    where isLong xs = length xs > 15

-- Lambdas

numLongChains' :: Int
numLongChains' = length (filter (\xs -> length xs > 15) (map chain ([1..100] :: [Int])))

addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

addThree' :: (Num a) => a -> a -> a -> a
addThree' = \x -> \y -> \z -> x + y + z

flip''' :: (a -> b -> c) -> b -> a -> c
flip''' f = \x y -> f y x

-- Folds

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y = foldl (\acc x -> (x == y) || acc) False

map'' :: (a -> b) -> [a] -> [b]
map'' f = foldr (\x acc -> f x : acc) []

containsThree :: [Int] -> Bool
containsThree = foldr (\x rest -> (x == 3) || rest) False

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 max

reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 const

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

sqrtSums :: Int
sqrtSums = length (takeWhile (< (1000 :: Float)) (scanl1 (+) (map sqrt [1..]))) + 1

-- Function application with $

{-
($) :: (a -> b) -> a -> b
f $ x = f x
-}

-- Function composition

{-
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)
-}

fn :: Float -> Int
fn x = ceiling (negate (tan (cos (max 50 x))))

fn' :: Float -> Int
fn' = ceiling . negate . tan . cos . max 50

oddSquareSum :: Integer
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^ (2 :: Int)) [1..])))

oddSquareSum' :: Integer
oddSquareSum' = sum . takeWhile (<10000) . filter odd . map (^ (2 :: Int)) $ [1..]

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
    print $ map' (+3) ([1,5,3,1,6] :: [Int])
    print $ map' (++ "!") ["abc", "def", "ghi"]
    print $ map' (replicate 3) ([3..5] :: [Int])
    print $ map' (map' (^(2 :: Int))) ([[1,2],[3,4,5,6],[7,8]] :: [[Int]])
    print $ map' fst ([(1,2),(3,5),(6,3),(2,6),(2,5)] :: [(Int, Int)])
    print $ filter' (>3) ([1,5,3,2,1,6,4,3,2,1] :: [Int])
    print $ filter' (==3) ([1,2,3,4,5] :: [Int])
    print $ filter' even ([1..10] :: [Int])
    print $ let notNull x = not (null x) in filter' notNull ([[1,2,3],[],[3,4,5],[2,2],[],[],[]] :: [[Int]])
    print $ filter' (`elem` ['a'..'z']) "Hello, World!"
    print $ filter' (`elem` ['A'..'Z']) "Hello, World!"
    print $ quicksort "efadbc"
    print (largestDivisible :: Int)
    print $ takeWhile (/=' ') "elephants know how to party"
    print (sum (takeWhile (<10000) (filter odd (map (^(2 :: Int)) [1..]))) :: Int)
    print (sum (takeWhile (<10000) [n^(2 :: Int) | n <- [1..], odd (n^(2 :: Int))]) :: Int)
    print ((chain 10, chain 30) :: ([Int], [Int]))
    print numLongChains
    let listOfFuncs = map (*) [0..]
    print $ (listOfFuncs !! 4) (5 :: Int)

    -- Lambdas
    print numLongChains'
    print (zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5] :: [Float])
    print (map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)] :: [Int])
    print (addThree 1 2 3 :: Int)
    print (addThree' 1 2 3 :: Int)
    print $ flip''' (++) "a" "b"

    -- Folds
    print (sum' [3,5,2,1] :: Int)
    print (sum'' [3,5,2,1] :: Int)
    print $ 'b' `elem'` "abc"
    print $ map'' (+3) ([1,5,3,1,6] :: [Int])
    print $ containsThree [1..]
    print $ maximum' "abczdef"
    print $ reverse' "hello"
    print (product' [1..10] :: Int)
    print $ filter'' even ([1..10] :: [Int])
    print $ head' "abcdef"
    print $ last' "abcdef"
    print (scanl (+) 0 [3,5,2,1] :: [Int])
    print (scanr (+) 0 [3,5,2,1] :: [Int])
    print (scanl1 max [3,4,5,3,7,9,2,1] :: [Int])
    print (scanl (flip (:)) [] [3,2,1] :: [[Int]])
    print sqrtSums
    print (sum (map sqrt [1..131]) :: Float)
    print (sum (map sqrt [1..130]) :: Float)

    -- Function application with $
    print (sum $ map sqrt [1..130] :: Float)
    print (sqrt $ 3 + 4 + 9 :: Float)
    print (sum $ filter (> 10) $ map (*2) [2..10] :: Int)
    print (map ($ 3) [(4+), (10*), (^ (2 :: Int)), sqrt] :: [Float])

    -- Function composition
    print (negate . (*3) $ 10 :: Int)
    print (map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] :: [Int])
    print (map (negate . abs) [5,-3,-6,7,-3,2,-19,24] :: [Int])
    print (map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]] :: [Int])
    print (map (negate . sum . tail) [[1..5],[3..6],[1..7]] :: [Int])
    print (sum (replicate 5 (max 6.7 8.9)) :: Float)
    print ((sum . replicate 5 . max 6.7) 8.9 :: Float)
    print (sum . replicate 5 . max 6.7 $ 8.9 :: Float)
    print (replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8]))) :: [Int])
    print (replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8] :: [Int])
    print $ fn 144000
    print $ fn' 144000
    print oddSquareSum
    print oddSquareSum'