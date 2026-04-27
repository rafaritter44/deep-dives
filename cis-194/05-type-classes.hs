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

main :: IO ()
main = do
    print $ f1 == f1 && f1 /= f2 && f2 /= f3 && f3 /= f4 && f4 == f4
    print $ f1' == f1' && f1' /= f2' && f2' /= f3' && f3' /= f4' && f4' == f4'
    print (f1', f2', f3', f4')