data D = C String Integer Bool
    deriving Show

d :: D
d = C "abc" 123 True

data D' = C' { field1 :: String, field2 :: Integer, field3 :: Bool }
    deriving Show

d' :: D'
d' = C' { field3 = True, field2 = 123, field1 = "abc" }

d'' :: D'
d'' = C' "abc" 123 True

main :: IO ()
main = putStrLn "Please enter a number: " >> (readLn >>= (\(n :: Integer) -> print (n+1)))
    >> print d
    >> print d'
    >> print d''