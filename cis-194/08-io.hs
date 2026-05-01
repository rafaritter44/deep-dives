main :: IO ()
main = putStrLn "Please enter a number: " >> (readLn >>= (\(n :: Integer) -> print (n+1)))