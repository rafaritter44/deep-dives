data Funny f a = Funny a (f a)
    deriving Show

funny :: Funny Maybe Int
funny = Funny 1 (Just 2)

main :: IO ()
main = do
    print funny