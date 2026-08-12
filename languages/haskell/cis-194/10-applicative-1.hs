type Name = String

data Employee = Employee { name  :: Name
                         , phone :: String }
                deriving Show

maybeEmployee :: Maybe Name -> Maybe String -> Maybe Employee
maybeEmployee (Just name) (Just phone) = Just (Employee name phone)
maybeEmployee _ _                      = Nothing

employeeList :: [Name] -> [String] -> [Employee]
employeeList (x:xs) (y:ys) = Employee x y : employeeList xs ys
employeeList _ _           = []

data E = E Name String
    deriving Show

getName :: E -> Name
getName (E n _) = n

getPhone :: E -> String
getPhone (E _ p) = p

getEmployee :: E -> Employee
getEmployee e = Employee (getName e) (getPhone e)

{-
class Functor f => Applicative f where
    pure  :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
liftA2 h fa fb = (h `fmap` fa) <*> fb

(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap

instance Applicative Maybe where
    pure              = Just
    Nothing <*> _     = Nothing
    _ <*> Nothing     = Nothing
    Just f <*> Just x = Just (f x)
-}

m_name1, m_name2 :: Maybe Name
m_name1 = Nothing
m_name2 = Just "Brent"

m_phone1, m_phone2 :: Maybe String
m_phone1 = Nothing
m_phone2 = Just "555-1234"

ex01, ex02, ex03, ex04 :: Maybe Employee
ex01 = Employee <$> m_name1 <*> m_phone1
ex02 = Employee <$> m_name1 <*> m_phone2
ex03 = Employee <$> m_name2 <*> m_phone1
ex04 = Employee <$> m_name2 <*> m_phone2

main :: IO ()
main = do
    print $ zipWith maybeEmployee [Just "Alice", Just "Bob", Nothing] [Just "+5548999999999", Nothing, Just "+5511999999999"]
    print $ employeeList ["Alice", "Bob", "Charlie"] ["+5548999999999", "+5511999999999"]
    print $ getEmployee (E "Alice" "+5548999999999")
    print (ex01, ex02, ex03, ex04)