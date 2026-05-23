maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum' xs)

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n-1) x

main :: IO ()
main = do
    print $ maximum' ([1,2,3,4,50,6,70,8,9,10] :: [Int])
    print $ maximum'' ([1,2,3,4,50,6,70,8,9,10] :: [Int])
    print $ replicate' (10 :: Int) "abc"