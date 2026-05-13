main :: IO ()
main = do
    print ([1,2,3,4] ++ [9,10,11,12] :: [Integer])
    print $ "hello" ++ " " ++ "world"
    print $ 'A' : " SMALL CAT"
    print (5 : [1,2,3,4,5] :: [Integer])