data Foo = F Int | G Char

instance Eq Foo where
    (F i1) == (F i2) = i1 == i2
    (G c1) == (G c2) = c1 == c2
    _ == _ = False

    -- foo1 /= foo2 = not (foo1 == foo2)

f1 :: Foo
f1 = F 1

f2 :: Foo
f2 = F 2

f3 :: Foo
f3 = G 'a'

f4 :: Foo
f4 = G 'b'

data Foo' = F' Int | G' Char
    deriving (Eq, Ord, Show)

f1' :: Foo'
f1' = F' 1

f2' :: Foo'
f2' = F' 2

f3' :: Foo'
f3' = G' 'a'

f4' :: Foo'
f4' = G' 'b'

class Listable a where
    toList :: a -> [Int]

instance Listable Int where
    toList x = [x]

instance Listable Bool where
    toList True  = [1]
    toList False = [0]

instance Listable [Int] where
    toList = id

data Tree a = Empty | Node a (Tree a) (Tree a)

instance Listable (Tree Int) where
    toList Empty        = []
    toList (Node x l r) = toList l ++ [x] ++ toList r

tree :: Tree Int
tree = Node 1 (Node 2 Empty Empty) Empty

sumL :: Listable a => a -> Int
sumL x = sum (toList x)

foo :: (Listable a, Ord a) => a -> a -> Bool
foo x y = sum (toList x) == sum (toList y) || x < y

instance (Listable a, Listable b) => Listable (a,b) where
    toList (x,y) = toList x ++ toList y

main :: IO ()
main = do
    print $ f1 == f1 && f1 /= f2 && f2 /= f3 && f3 /= f4 && f4 == f4
    print $ f1' == f1' && f1' /= f2' && f2' /= f3' && f3' /= f4' && f4' == f4'
    print [f1', f2', f3', f4']
    print $ f1' < f2' && f2' < f3' && f3' < f4'
    print $ toList (1 :: Int)
    print $ map toList [True, False]
    print $ toList ([1,2,3] :: [Int])
    print $ toList tree
    print $ sumL tree
    print $ foo False True
    print $ toList (False, (True, tree))