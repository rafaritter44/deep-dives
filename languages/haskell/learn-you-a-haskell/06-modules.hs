-- Loading modules

import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)
import qualified Data.Map
import qualified Data.Map as M
import Data.Char
import Data.Function ((&))

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- Data.List

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in  foldl (\acc x -> (take nlen x == needle) || acc) False (tails haystack)

on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
f `on` g = \x y -> f (g x) (g y)

-- Data.Char

encode :: Int -> String -> String
encode shift msg =
    let ords = map ord msg
        shifted = map (+ shift) ords
    in  map chr shifted

decode :: Int -> String -> String
decode shift = encode $ negate shift

-- Data.Map

phoneBookToMap :: (Ord k) => [(k, String)] -> M.Map k String
phoneBookToMap = M.fromListWith (\number1 number2 -> number1 ++ ", " ++ number2)

main :: IO ()
main = do
    -- Loading modules
    print $ numUniques "aaabbbcccddd"
    let intStrList :: [(Int, String)]
        intStrList = [(5,"a"), (3,"b")] :: [(Int, String)]
    print $ Data.Map.filter (> "a") $ Data.Map.fromList intStrList
    print $ M.filter (> "a") $ M.fromList intStrList

    -- Data.List
    print $ intersperse '.' "Hello"
    print $ intersperse (0 :: Int) [1..6]
    print $ intercalate " " ["hey", "there", "folks"]
    print $ intercalate ([0,0,0] :: [Int]) [[1,2,3],[4,5,6],[7,8,9]]
    print (transpose [[1,2,3],[4,5,6],[7,8,9]] :: [[Int]])
    print $ transpose ["hey", "there", "folks"]
    print (map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]] :: [Int])
    print $ concat ["foo","bar","car"]
    print (concat [[3,4,5],[2,3,4],[2,1,1]] :: [Int])
    print (concatMap (replicate 4) [1..3] :: [Int])
    print $ and $ map (>4) ([5,6,7,8] :: [Int])
    print $ and $ map (==4) ([4,4,4,3,4] :: [Int])
    print $ or $ map (==4) ([2,3,4,5,6,1] :: [Int])
    print $ or $ map (>4) ([1,2,3] :: [Int])
    print $ any (==4) ([2,3,5,6,1,4] :: [Int])
    print $ any (`elem` ['A'..'Z']) "HEYGUYSwhatsup"
    print $ all (>4) ([6,9,10] :: [Int])
    print $ all (`elem` ['A'..'Z']) "HEYGUYSwhatsup"
    print $ take 10 $ iterate (*2) (1 :: Int)
    print $ take 3 $ iterate (++ "haha") "haha"
    print $ splitAt 3 "heyman"
    print $ splitAt 100 "heyman"
    print $ splitAt (-3) "heyman"
    print $ let (a,b) = splitAt 3 "foobar" in b ++ a
    print $ takeWhile (>3) ([6,5,4,3,2,1,2,3,4,5,4,3,2,1] :: [Int])
    print $ takeWhile (/=' ') "This is a sentence"
    print $ sum $ takeWhile (<10000) $ map (^ (3 :: Int)) ([1..] :: [Int])
    print $ dropWhile (/=' ') "This is a sentence"
    print $ dropWhile (<3) ([1,2,2,2,3,4,5,4,3,2,1] :: [Int])
    let stock :: [(Double, Int, Int, Int)]
        stock = [(994.4,2008,9,1),(995.2,2008,9,2),(999.2,2008,9,3),(1001.4,2008,9,4),(998.3,2008,9,5)]
    print $ head $ dropWhile (\(val,_,_,_) -> val < 1000) stock
    print $ let (fw, rest) = span (/=' ') "This is a sentence" in "First word: " ++ fw ++ ", the rest:" ++ rest
    print $ break (==4) ([1,2,3,4,5,6,7] :: [Int])
    print $ span (/=4) ([1,2,3,4,5,6,7] :: [Int])
    print $ sort "This will be sorted soon"
    print $ group ([1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7] :: [Int])
    print $ map (\l@(x:_) -> (x,length l)) . group . sort $ ([1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7] :: [Int])
    print $ inits "abcd"
    print $ tails "abcd"
    print $ let w = "abcd" in zip (inits w) (tails w)
    print $ search "cd" "abcdef"
    print $ "cd" `isInfixOf` "abcdef"
    print $ "ab" `isPrefixOf` "abcdef"
    print $ "ef" `isSuffixOf` "abcdef"
    print $ partition (`elem` ['A'..'Z']) "PADREcarloPIOacutis"
    print $ partition (>3) ([1,3,5,6,3,2,1,0,3,7] :: [Int])
    print $ find (>4) ([1..6] :: [Int])
    print $ find (>9) ([1..6] :: [Int])
    print $ find (\(val,_,_,_) -> val > 1000) stock
    print $ 4 `elemIndex` ([1..6] :: [Int])
    print $ 10 `elemIndex` ([1..6] :: [Int])
    print $ ' ' `elemIndices` "Where are the spaces?"
    print $ findIndex (==4) ([5,3,2,1,6,4] :: [Int])
    print $ findIndex (==7) ([5,3,2,1,6,4] :: [Int])
    print $ findIndices (`elem` ['A'..'Z']) "Where Are The Caps?"
    print (zipWith3 (\x y z -> x + y + z) [1,2,3] [4,5,2,2] [2,2,3] :: [Int])
    print (zip4 [2,3,3] [2,2,2] [5,5,3] [2,2,2] :: [(Int, Int, Int, Int)])
    print $ lines "first line\nsecond line\nthird line"
    print $ unlines ["first line", "second line", "third line"]
    print $ words "hey these are the words in this sentence"
    print $ words "hey these           are    the words in this\nsentence"
    print $ unwords ["hey","there","mate"]
    print (nub [1,2,3,4,3,2,1,2,3,4,3,2,1] :: [Int])
    print $ nub "Lots of words and stuff"
    print $ delete 'h' "hey there!"
    print $ delete 'h' . delete 'h' $ "hey there"
    print ([1..10] \\ [2,5,9] :: [Int])
    print $ "Im a big baby" \\ "big"
    print $ "hey man" `union` "man what's up"
    print ([1..7] `union` [5..10] :: [Int])
    print ([1..7] `intersect` [5..10] :: [Int])
    print (insert 4 [3,5,1,2,8,2] :: [Int])
    print (insert 4 [1,3,4,4,1] :: [Int])
    print (insert 4 [1,2,3,5,6,7] :: [Int])
    print $ insert 'g' $ ['a'..'f'] ++ ['h'..'z']
    print (insert 3 [1,2,4,3,2,1] :: [Int])
    let values :: [Double]
        values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]
    print $ groupBy (\x y -> (x > 0) == (y > 0)) values
    print $ groupBy ((==) `on` (> 0)) values
    let xs :: [[Int]]
        xs = [[5,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]
    print $ sortBy (compare `on` length) xs

    -- Data.Char
    print $ all isAlphaNum "abc123"
    print $ all isAlphaNum "abc def 123!"
    print $ words "hey folks its me"
    print $ groupBy ((==) `on` isSpace) "hey folks its me"
    print $ filter (not . any isSpace) . groupBy ((==) `on` isSpace) $ "hey folks its me"
    print $ map generalCategory [' ', 'a', 'A', '0', '.', '|', '\n']
    print $ map digitToInt "34538"
    print $ map digitToInt "FF85AB"
    print $ map intToDigit [5, 15]
    print (ord 'a', chr 97)
    print $ map ord "abcdefgh"
    let shift = 3
    let secretMsg = encode shift "A secret message"
    print secretMsg
    print $ decode shift secretMsg

    -- Data.Map
    print $ M.empty & M.insert 'A' "Alice" & M.insert 'B' "Bob"
    print $ M.null M.empty
    print $ M.null $ M.fromList [('A', "Alice")]
    print $ M.size M.empty
    print $ M.size $ M.fromList [('A', "Alice")]
    print $ M.singleton 'A' "Alice"
    print $ M.member 'A' $ M.singleton 'A' "Alice"
    print $ M.member 'A' $ M.singleton 'B' "Bob"
    print $ M.map (*100) $ M.fromList ([(1,1),(2,4),(3,9)] :: [(Int,Int)])
    print $ M.filter isUpper $ M.fromList ([(1,'a'),(2,'A'),(3,'b'),(4,'B')] :: [(Int,Char)])
    print $ M.singleton 'A' "Alice" & M.insert 'B' "Bob" & M.toList
    let phoneBook =
          [("Alice","555-2938")
          ,("Alice","342-2492")
          ,("Bob","452-2928")
          ,("Charlie","493-2928")
          ,("Charlie","943-2929")
          ,("Charlie","827-9162")
          ,("David","205-2928")
          ,("Eve","939-8282")
          ,("Frank","853-2492")
          ,("Frank","555-2111")
          ]
    print $ M.lookup "Alice" $ phoneBookToMap phoneBook
    print $ M.lookup "Bob" $ phoneBookToMap phoneBook
    print $ M.lookup "Charlie" $ phoneBookToMap phoneBook
    print $ M.lookup "Grace" $ phoneBookToMap phoneBook
