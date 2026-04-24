data IntList = Empty | Cons Int IntList
    deriving Show

intList :: IntList
intList = Cons (-1) (Cons 2 (Cons (-6) Empty))

mapIntList :: (Int -> Int) -> IntList -> IntList
mapIntList _ Empty       = Empty
mapIntList f (Cons x xs) = Cons (f x) (mapIntList f xs)

filterIntList :: (Int -> Bool) -> IntList -> IntList
filterIntList _ Empty       = Empty
filterIntList p (Cons x xs)
    | p x       = Cons x (filterIntList p xs)
    | otherwise = filterIntList p xs

main :: IO ()
main = do
    print (mapIntList abs intList)
    print (filterIntList even intList)