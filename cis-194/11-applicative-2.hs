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

(.+), (.*) :: (Applicative f, Num a) => f a -> f a -> f a
(.+) = liftA2 (+) -- addition lifted to some Applicative context
(.*) = liftA2 (*) -- same for multiplication

-- nondeterministic arithmetic
n :: [Integer]
n = ([4,5] .* pure 2) .+ [6,1] -- (either 4 or 5) times 2, plus either 6 or 1

-- and some possibly-failing arithmetic too, just for fun
m1, m2 :: Maybe Integer
m1 = (Just 3 .+ Just 5) .* Just 8
m2 = (Just 3 .+ Nothing) .* Just 8

main :: IO ()
main = do
    print employees1
    print n
    print (m1, m2)