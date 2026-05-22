maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

main :: IO ()
main = do
    print $ maximum' ([1,2,3,4,50,6,70,8,9,10] :: [Int])