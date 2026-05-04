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

main :: IO ()
main = do
    print $ zipWith maybeEmployee [Just "Alice", Just "Bob", Nothing] [Just "+5548999999999", Nothing, Just "+5511999999999"]
    print $ employeeList ["Alice", "Bob", "Charlie"] ["+5548999999999", "+5511999999999"]