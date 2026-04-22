data Thing = Shoe
           | Ship
           | SealingWax
           | Cabbage
           | King
    deriving Show
shoe :: Thing
shoe = Shoe

main :: IO ()
main = do
    print shoe