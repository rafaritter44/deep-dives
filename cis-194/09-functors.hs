data Funny f a = Funny a (f a)
    deriving Show

funny :: Funny Maybe Int
funny = Funny 1 (Just 2)

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Main.Functor Maybe where
    fmap _ Nothing  = Nothing
    fmap h (Just a) = Just (h a)

instance Main.Functor [] where
    fmap _ []     = []
    fmap f (x:xs) = f x : Main.fmap f xs
    -- or just
    -- fmap = map

instance Main.Functor IO where
    -- fmap f ioa = ioa >>= (\a -> return (f a))
    fmap f ioa = ioa >>= (return . f)

main :: IO ()
main = do
    print funny
    print $ Main.fmap succ (Just (1 :: Int))
    print $ Main.fmap pred ([1,2,3] :: [Int])
    putStrLn "Enter some text:"
    Main.fmap length getLine >>= print