factorial :: Integer -> Integer
factorial n = product [1..n]

main :: IO ()
main = do
    print $ factorial 50
    print $ "Abrakadabra" < "Zebra"
    print $ "Abrakadabra" `compare` "Zebra"
    print $ 5 `compare` 3