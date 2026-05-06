{-
class Functor f where
    fmap :: (a -> b) -> f a -> f b

class Functor f => Applicative f where
    pure  :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

instance Applicative [] where
    pure a        = [a] -- a "deterministic" value
    [] <*> _      = []
    (f:fs) <*> as = (map f as) ++ (fs <*> as)
-}

type Name = String

data Employee = Employee { name  :: Name
                         , phone :: String }
                deriving Show

names :: [Name]
names  = ["Joe", "Sara", "Mae"]

phones :: [String]
phones = ["555-5555", "123-456-7890", "555-4321"]

employees1 :: [Employee]
employees1 = Employee <$> names <*> phones

main :: IO ()
main = do
    print employees1