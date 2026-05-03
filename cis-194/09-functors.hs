data Funny f a = Funny a (f a)
    deriving Show

funny :: Funny Maybe Int
funny = Funny 1 (Just 2)

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Main.Functor Maybe where
    fmap _ Nothing  = Nothing
    fmap h (Just a) = Just (h a)

main :: IO ()
main = do
    print funny
    print $ Main.fmap succ (Just (1 :: Int))