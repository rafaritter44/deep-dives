main :: IO ()
main = do
    let lst = [1,2,3] :: [Int]
    print (sum (map (3*) lst))

    let x :: Int
        x = 3
    print x