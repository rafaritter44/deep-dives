factorial :: Integer -> Integer
factorial n = product [1..n]

main :: IO ()
main = do
    print $ factorial 50