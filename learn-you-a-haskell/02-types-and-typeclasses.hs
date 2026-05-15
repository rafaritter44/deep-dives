factorial :: Integer -> Integer
factorial n = product [1..n]

main :: IO ()
main = do
    print $ factorial 50

    -- Ord
    print $ "Abrakadabra" < "Zebra"
    print $ "Abrakadabra" `compare` "Zebra"
    print $ 5 `compare` 3

    -- Show
    print $ show 3
    print $ show 5.334
    print $ show True

    -- Read
    print $ read "True" || False
    print $ read "8.2" + 3.8
    print $ read "5" - 2
    print $ read "[1,2,3,4]" ++ [3]
    print (read "5" :: Int)
    print (read "5" :: Float)
    print $ (read "5" :: Float) * 4
    print (read "[1,2,3,4]" :: [Int])
    print (read "(3, 'a')" :: (Int, Char))

    -- Enum
    print (['a'..'e'], [LT .. GT], [3..5], succ 'B')

    -- Bounded
    print (minBound :: Int)
    print (maxBound :: Char)
    print (maxBound :: Bool)
    print (minBound :: Bool)