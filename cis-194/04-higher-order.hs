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