g100 :: Integer -> Bool
g100 x = x > 100

greaterThan100 :: [Integer] -> [Integer]
greaterThan100 xs = filter g100 xs

greaterThan100_2 :: [Integer] -> [Integer]
greaterThan100_2 xs = filter (\x -> x > 100) xs

main :: IO ()
main = do
    let integers :: [Integer]
        integers = [1,9,349,6,907,98,105]
    print $ greaterThan100 integers
    print $ greaterThan100_2 integers