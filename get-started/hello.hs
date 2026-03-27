main = do
  print (6 + 3^2 * 4)
  print (take 10 (filter even [43..]))
  putStrLn "Hello, everybody!"
  putStrLn ("Please look at my favorite odd numbers: " ++ show (filter odd [10..20]))