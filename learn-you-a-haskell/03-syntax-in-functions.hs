lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky _ = "Sorry, you're out of luck, pal!"

main :: IO ()
main = do
    print $ map lucky ([3, 7, 12] :: [Int])