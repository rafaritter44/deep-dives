import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

main :: IO ()
main = do
    print $ numUniques "aaabbbcccddd"