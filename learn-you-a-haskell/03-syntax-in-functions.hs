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

densityTell''' :: (RealFloat a) => a -> a -> String
densityTell''' mass volume
    | density < air    = "Wow! You're going for a ride in the sky!"
    | density <= water = "Have fun swimming, but watch out for sharks!"
    | otherwise        = "If it's sink or swim, you're going to sink."
    where density = mass / volume
          air     = 1.2
          water   = 1000.0

densityTell'''' :: (RealFloat a) => a -> a -> String
densityTell'''' mass volume
    | density < air    = "Wow! You're going for a ride in the sky!"
    | density <= water = "Have fun swimming, but watch out for sharks!"
    | otherwise        = "If it's sink or swim, you're going to sink."
    where density = mass / volume
          (air, water) = (1.2, 1000.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcDensities :: (RealFloat a) => [(a, a)] -> [a]
calcDensities xs = [density m v | (m, v) <- xs]
    where density mass volume = mass / volume

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea  = pi * r ^ (2 :: Int)
    in  sideArea + 2 * topArea

calcDensities' :: (RealFloat a) => [(a, a)] -> [a]
calcDensities' xs = [density | (m, v) <- xs, let density = m / v]

calcDensities'' :: (RealFloat a) => [(a, a)] -> [a]
calcDensities'' xs = [density | (m, v) <- xs, let density = m / v, density < 2.1]

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
    print $ densityTell''' (100 :: Float) 50
    print $ densityTell'''' (100 :: Float) 50
    print $ initials "Rafael" "Ritter"
    print $ calcDensities [(100 :: Float, 50), (200, 25)]
    print $ cylinder (10 :: Float) 20
    print $ 4 * (let a = 9 in a + 1) + (2 :: Int)
    print $ let square (x :: Int) = x * x in (square 5, square 3, square 2)
    print (let (a :: Int) = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
    print $ (let (a,b,c) = (1,2,3) in a+b+c) * (100 :: Int)
    print $ calcDensities' [(100 :: Float, 50), (200, 25)]
    print $ calcDensities'' [(100 :: Float, 50), (200, 25)]