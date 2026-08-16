import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)
import qualified Data.Map
import qualified Data.Map as M

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

intStrList :: [(Int, String)]
intStrList = [(5,"a"), (3,"b")] :: [(Int, String)]

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in  foldl (\acc x -> (take nlen x == needle) || acc) False (tails haystack)

main :: IO ()
main = do
    print $ numUniques "aaabbbcccddd"
    print $ Data.Map.filter (> "a") $ Data.Map.fromList intStrList
    print $ M.filter (> "a") $ M.fromList intStrList
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
