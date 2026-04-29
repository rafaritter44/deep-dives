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

main :: IO ()
main = do
    print $ f1 maybeInteger
    print $ f2 maybeInteger
    print $ take 3 (repeat 7)
    print $ False &&  (34^9784346 > 34987345)
    print $ False &&! (34^9784346 > 34987345)
    print $ False &&  (head [] == 'x')
    -- print $ False &&! (head [] == 'x')
    print $ map (\test -> if' test 1 0) [True, False]