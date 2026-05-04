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

main :: IO ()
main = do
    print $ zipWith maybeEmployee [Just "Alice", Just "Bob", Nothing] [Just "+5548999999999", Nothing, Just "+5511999999999"]
    print $ employeeList ["Alice", "Bob", "Charlie"] ["+5548999999999", "+5511999999999"]
    print $ getEmployee (E "Alice" "+5548999999999")