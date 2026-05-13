main :: IO ()
main = do
    print ([1,2,3,4] ++ [9,10,11,12] :: [Integer])
    print $ "hello" ++ " " ++ "world"
    print $ 'A' : " SMALL CAT"
    print (5 : [1,2,3,4,5] :: [Integer])
    print $ "0123456789" !! 7
    print $ [3,2,1] > [2,1,0]
    print $ [3,2,1] > [2,10,100]
    print $ [3,4,2] > [3,4]
    print $ [3,4,2] > [2,4]
    print $ [3,4,2] == [3,4,2]