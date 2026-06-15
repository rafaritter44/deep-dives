import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)
import qualified Data.Map
import qualified Data.Map as M

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

intStrList :: [(Int, String)]
intStrList = [(5,"a"), (3,"b")] :: [(Int, String)]

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