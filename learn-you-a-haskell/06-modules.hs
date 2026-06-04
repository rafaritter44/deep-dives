import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)
import qualified Data.Map

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

intStrList :: [(Int, String)]
intStrList = [(5,"a"), (3,"b")] :: [(Int, String)]

main :: IO ()
main = do
    print $ numUniques "aaabbbcccddd"
    print $ Data.Map.filter (> "a") $ Data.Map.fromList intStrList