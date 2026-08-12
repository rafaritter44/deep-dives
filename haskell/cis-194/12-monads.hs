{-
class Monad m where
    return :: a -> m a

    (>>=) :: m a -> (a -> m b) -> m b

    (>>) :: m a -> m b -> m b
    m1 >> m2 = m1 >>= \_ -> m2

-- There is actually a fourth method called fail,
-- but putting it in the Monad class was a mistake,
-- and you should never use it.
-}

{-
instance Monad Maybe where
    return        = Just
    Nothing >>= _ = Nothing
    Just x  >>= k = k x
-}

check :: Int -> Maybe Int
check n | n < 10    = Just n
        | otherwise = Nothing

halve :: Int -> Maybe Int
halve n | even n    = Just $ n `div` 2
        | otherwise = Nothing

ex01, ex02, ex03 :: Maybe Int
ex01 = return 7 >>= check >>= halve
ex02 = return 12 >>= check >>= halve
ex03 = return 12 >>= halve >>= check

{-
instance Monad [] where
    return x = [x]
    xs >>= k = concat (map k xs)
-}

addOneOrTwo :: Int -> [Int]
addOneOrTwo x = [x+1, x+2]

ex04 :: [Int]
ex04 = [10,20,30] >>= addOneOrTwo

{-
sequence :: Monad m => [m a] -> m [a]
sequence [] = return []
sequence (ma:mas) =
    ma >>= \a ->
    sequence mas >>= \as ->
    return (a:as)
-}

replicateM :: Monad m => Int -> m a -> m [a]
replicateM n m = sequence (replicate n m)

main :: IO ()
main = do
    print (ex01, ex02, ex03)
    print ex04
    print $ sequence [Just "a", Just "b", Just "c"]
    putStrLn "Enter two lines of text:"
    sequence [getLine, getLine] >>= print
    print $ replicateM 3 ["abc", "def"]