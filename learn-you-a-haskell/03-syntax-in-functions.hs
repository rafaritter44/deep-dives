lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky _ = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe _ = "Not between 1 and 5"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName _   = "Unknown"

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

tuples :: [(Int, Int)]
tuples = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell [x] = "The list has one element: " ++ show x
tell [x,y] = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
capital wholeStr@(x:_) = "The first letter of " ++ wholeStr ++ " is " ++ [x]

densityTell :: (RealFloat a) => a -> String
densityTell density
    | density < 1.2     = "Wow! You're going for a ride in the sky!"
    | density <= 1000.0 = "Have fun swimming, but watch out for sharks!"
    | otherwise         = "If it's sink or swim, you're going to sink."

densityTell' :: (RealFloat a) => a -> a -> String
densityTell' mass volume
    | mass / volume < 1.2     = "Wow! You're going for a ride in the sky!"
    | mass / volume <= 1000.0 = "Have fun swimming, but watch out for sharks!"
    | otherwise               = "If it's sink or swim, you're going to sink."

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

densityTell'' :: (RealFloat a) => a -> a -> String
densityTell'' mass volume
    | density < 1.2     = "Wow! You're going for a ride in the sky!"
    | density <= 1000.0 = "Have fun swimming, but watch out for sharks!"
    | otherwise         = "If it's sink or swim, you're going to sink."
    where density = mass / volume

main :: IO ()
main = do
    print $ map lucky ([3, 7, 12] :: [Int])
    print $ map sayMe ([1..6] :: [Int])
    print $ factorial (50 :: Integer)
    print $ map charName ['a', 'b', 'c', 'd']
    print $ addVectors ((1, 2) :: (Int, Int)) ((3, 4) :: (Int, Int))
    print $ addVectors' ((1, 2) :: (Int, Int)) ((3, 4) :: (Int, Int))
    print [a+b | (a,b) <- tuples]
    print $ head' "Hello"
    print $ map tell ["", "a", "ab", "abc", "abcd"]
    print (length' "Hello" :: Int)
    print (sum' [1,2,3,4,5] :: Int)
    print $ capital "Hello"
    print $ densityTell (1000 :: Float)
    print $ densityTell' (100 :: Float) 50
    print $ max' True False
    print $ 'a' `myCompare` 'b'
    print $ densityTell'' (100 :: Float) 50