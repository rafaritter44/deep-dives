g100 :: Integer -> Bool
g100 x = x > 100

greaterThan100 :: [Integer] -> [Integer]
greaterThan100 xs = filter g100 xs

greaterThan100_2 :: [Integer] -> [Integer]
greaterThan100_2 xs = filter (\x -> x > 100) xs

greaterThan100_3 :: [Integer] -> [Integer]
greaterThan100_3 xs = filter (>100) xs

myTest :: [Integer] -> Bool
myTest xs = even (length (greaterThan100 xs))

myTest' :: [Integer] -> Bool
myTest' = even . length . greaterThan100

f :: Int -> Int -> Int
f x y = 2*x + y

f' :: Int -> (Int -> Int)
f' x y = 2*x + y

f'' :: (Int,Int) -> Int
f'' (x,y) = 2*x + y

f''' :: Int -> Int -> Int
f''' x = \y -> 2*x + y

foobar :: [Integer] -> Integer
foobar []       = 0
foobar (x:xs)
    | x > 3     = (7*x + 2) + foobar xs
    | otherwise = foobar xs

foobar' :: [Integer] -> Integer
foobar' = sum . map (\x -> 7*x + 2) . filter (>3)

sum' :: [Integer] -> Integer
sum' []     = 0
sum' (x:xs) = x + sum' xs

product' :: [Integer] -> Integer
product' [] = 1
product' (x:xs) = x * product' xs

length' :: [a] -> Int
length' []     = 0
length' (_:xs) = 1 + length' xs

fold :: b -> (a -> b -> b) -> [a] -> b
fold z f []     = z
fold z f (x:xs) = f x (fold z f xs)

sum'' :: [Integer] -> Integer
sum'' = fold 0 (+)

product'' :: [Integer] -> Integer
product'' = fold 1 (*)

length'' :: [a] -> Integer
length'' = fold 0 (\_ s -> 1 + s)

length''' :: [a] -> Integer
length''' = fold 0 (\_ -> (1+))

length'''' :: [a] -> Integer
length'''' = fold 0 (const (1+))

main :: IO ()
main = do
    let integers :: [Integer]
        integers = [1,9,349,6,907,98,105]
    print $ greaterThan100 integers
    print $ greaterThan100_2 integers
    print $ (\x y z -> [x,2*y,3*z]) 5 6 3
    print $ greaterThan100_3 integers
    print $ (>100) 102
    print $ (100>) 102
    print $ map (*6) [1..5]
    print $ myTest integers
    print $ myTest' integers
    print $ f 1 2
    print $ f' 1 2
    print $ f'' (1,2)
    print $ curry f'' 1 2
    print $ uncurry (+) (2,3)
    print $ f''' 1 2
    print $ foobar integers
    print $ foobar' integers
    print $ sum' integers
    print $ product' integers
    print $ length' integers
    print $ sum'' integers
    print $ product'' integers
    print $ length'' integers
    print $ length''' integers
    print $ length'''' integers