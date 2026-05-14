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
    print $ take 1 [3,9,3]
    print $ take 5 [1,2]
    print $ take 0 [7,7,7]
    print $ drop 3 [8,4,2,1,5,6]
    print $ drop 0 [1,2,3,4]
    print $ drop 100 [1,2,3,4]
    print $ minimum [8,4,2,1,5,6]
    print $ maximum [1,9,2,3,4]
    print $ sum [5,2,1,6,3,2,5,7]
    print $ product [6,2,1,2]
    print $ product [1,2,5,6,7,9,2,0]
    print $ 4 `elem` [3,4,5,6]
    print $ 10 `elem` [3,4,5,6]
    print ([1..20], ['a'..'z'], ['K'..'Z'])
    print ([2,4..20], [3,6..20])
    print [0.1, 0.3..1]