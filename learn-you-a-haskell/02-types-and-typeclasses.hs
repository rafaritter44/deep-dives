factorial :: Integer -> Integer
factorial n = product [1..n]

main :: IO ()
main = do
    print $ factorial 50
    print $ "Abrakadabra" < "Zebra"
    print $ "Abrakadabra" `compare` "Zebra"
    print $ 5 `compare` 3
    print $ show 3
    print $ show 5.334
    print $ show True
    print $ read "True" || False
    print $ read "8.2" + 3.8
    print $ read "5" - 2
    print $ read "[1,2,3,4]" ++ [3]