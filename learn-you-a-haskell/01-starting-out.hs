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
    print $ head [5,4,3,2,1]
    print $ tail [5,4,3,2,1]
    print $ last [5,4,3,2,1]
    print $ init [5,4,3,2,1]
    print $ length [5,4,3,2,1]
    print $ null [1,2,3]
    print $ null []
    print $ reverse [5,4,3,2,1]
    print $ take 3 [5,4,3,2,1]