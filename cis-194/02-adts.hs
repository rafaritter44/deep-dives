data Thing = Shoe
           | Ship
           | SealingWax
           | Cabbage
           | King
    deriving Show
shoe :: Thing
shoe = Shoe
listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

main :: IO ()
main = do
    print shoe
    print listO'Things