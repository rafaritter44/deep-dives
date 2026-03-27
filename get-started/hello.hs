main :: IO ()
main = do
  print (6 + 3^2 * 4)
  let xs = take 10 (filter even [43..])
  print xs
  print (sum xs)
  putStrLn "Hello, everybody!"
  putStrLn ("Please look at my favorite odd numbers: " ++ show (filter odd [10..20]))