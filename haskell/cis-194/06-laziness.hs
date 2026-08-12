import Data.Array

f1 :: Maybe a -> [Maybe a]
f1 m = [m,m]

f2 :: Maybe a -> [a]
f2 Nothing  = []
f2 (Just x) = [x]

safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

maybeInteger :: Maybe Integer
maybeInteger = safeHead [3 ^ (500 :: Integer), 49]

{-
(&&) :: Bool -> Bool -> Bool
True  && x = x
False && _ = False
-}

(&&!) :: Bool -> Bool -> Bool
True  &&! True  = True
True  &&! False = False
False &&! True  = False
False &&! False = False

if' :: Bool -> a -> a -> a
if' True  x _ = x
if' False _ y = y

knapsack01 :: [Double]  -- values
           -> [Integer] -- nonnegative weights
           -> Integer   -- knapsack size
           -> Double    -- max possible value
knapsack01 vs ws maxW = m!(numItems-1, maxW)
    where numItems = length vs
          m        = array ((-1,0), (numItems-1, maxW)) $
            [((-1,w), 0) | w <- [0 .. maxW]] ++
            [((i,0) , 0) | i <- [0 .. numItems-1]] ++
            [((i,w) , best)
                | i <- [0 .. numItems-1]
                , w <- [1 .. maxW]
                , let best
                        | ws!!i > w = m!(i-1, w)
                        | otherwise = max (m!(i-1, w))
                                          (m!(i-1, w - ws!!i) + vs!!i)
            ]

main :: IO ()
main = do
    print $ f1 maybeInteger
    print $ f2 maybeInteger
    print $ take 3 (repeat 7)
    print $ False &&  (34^9784346 > 34987345)
    print $ False &&! (34^9784346 > 34987345)
    print $ False &&  (head [] == 'x')
    -- print $ False &&! (head [] == 'x')
    print $ map (\test -> if' test 't' 'f') [True, False]
    print $ knapsack01 [3,4,5,8,10] [2,3,4,5,9] 20