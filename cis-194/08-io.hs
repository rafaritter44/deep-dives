data D = C String Integer Bool
    deriving Show

d :: D
d = C "abc" 123 True

main :: IO ()
main = putStrLn "Please enter a number: " >> (readLn >>= (\(n :: Integer) -> print (n+1)))
    >> print d