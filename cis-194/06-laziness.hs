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

main :: IO ()
main = do
    print $ f1 maybeInteger
    print $ f2 maybeInteger