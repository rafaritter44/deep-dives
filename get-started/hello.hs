main :: IO ()
main = do
  print (6 + 3^2 * 4)
  let xs :: [Int]
      xs = take 10 (filter even [43..])
  print xs
  print (sum xs)

  putStrLn "Hello, everybody!"
  putStrLn ("Please look at my favorite odd numbers: " ++ show (filter odd [10..20]))

  let double x = x + x
  print (double 2)
  let map f list =
        case list of
            [] -> []
            x : xs -> f x : map f xs
  print (map double [1,2,3])