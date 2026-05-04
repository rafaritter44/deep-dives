type Name = String

data Employee = Employee { name  :: Name
                         , phone :: String }
                deriving Show

maybeEmployee :: Maybe Name -> Maybe String -> Maybe Employee
maybeEmployee (Just name) (Just phone) = Just (Employee name phone)
maybeEmployee _ _                      = Nothing

main :: IO ()
main = do
    print $ zipWith maybeEmployee [Just "Alice", Just "Bob", Nothing] [Just "+5548999999999", Nothing, Just "+5511999999999"]