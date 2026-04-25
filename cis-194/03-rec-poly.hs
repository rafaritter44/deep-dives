data IntList = Empty | Cons Int IntList
    deriving Show

intList :: IntList
intList = Cons (-1) (Cons 2 (Cons (-6) Empty))

mapIntList :: (Int -> Int) -> IntList -> IntList
mapIntList _ Empty       = Empty
mapIntList f (Cons x xs) = Cons (f x) (mapIntList f xs)

filterIntList :: (Int -> Bool) -> IntList -> IntList
filterIntList _ Empty = Empty
filterIntList p (Cons x xs)
    | p x       = Cons x (filterIntList p xs)
    | otherwise = filterIntList p xs

data List t = E | C t (List t)
    deriving Show

lst1 :: List Int
lst1 = C 3 (C 5 (C 2 E))

lst2 :: List Char
lst2 = C 'x' (C 'y' (C 'z' E))

lst3 :: List Bool
lst3 = C True (C False E)

filterList :: (t -> Bool) -> List t -> List t
filterList _ E = E
filterList p (C x xs)
    | p x       = C x (filterList p xs)
    | otherwise = filterList p xs

mapList :: (a -> b) -> List a -> List b
mapList _ E        = E
mapList f (C x xs) = C (f x) (mapList f xs)

something :: Maybe String
something = Just "something"

nothing :: Maybe String
nothing = Nothing

doStuff1 :: [Int] -> Int
doStuff1 []  = 0
doStuff1 [_] = 0
doStuff1 xs  = head xs + head (tail xs)

doStuff2 :: [Int] -> Int
doStuff2 []        = 0
doStuff2 [_]       = 0
doStuff2 (x1:x2:_) = x1 + x2

safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

main :: IO ()
main = do
    print (mapIntList abs intList)
    print (filterIntList even intList)
    print (lst1, lst2, lst3)
    print (filterList even lst1)
    print (mapList even lst1)
    print (something, nothing)

    let oneTwoThree :: [Int]
        oneTwoThree = [1, 2, 3]

    -- Partial functions (functions that crash for certain inputs)
    print (head oneTwoThree)
    print (tail oneTwoThree)
    print (init oneTwoThree)
    print (last oneTwoThree)
    print (oneTwoThree !! 1)

    print (doStuff1 oneTwoThree)
    print (doStuff2 oneTwoThree)
    print (safeHead oneTwoThree)