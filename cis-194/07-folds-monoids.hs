data Tree a = Empty
            | Node (Tree a) a (Tree a)
    deriving (Show, Eq)

leaf :: a -> Tree a
leaf x = Node Empty x Empty

treeSize :: Tree a -> Integer
treeSize Empty        = 0
treeSize (Node l _ r) = 1 + treeSize l + treeSize r

treeSum :: Tree Integer -> Integer
treeSum Empty        = 0
treeSum (Node l x r) = x + treeSum l + treeSum r

treeDepth :: Tree a -> Integer
treeDepth Empty        = 0
treeDepth (Node l _ r) = 1 + max (treeDepth l) (treeDepth r)

flatten :: Tree a -> [a]
flatten Empty        = []
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

tree :: Tree Integer
tree = Node (Node (leaf 10) 20 Empty) 30 Empty

main :: IO ()
main = do
    print tree
    print $ treeSize tree
    print $ treeSum tree
    print $ treeDepth tree
    print $ flatten tree