main :: IO ()
main = do
  print (6 + 3^2 * 4)
  let evenNums :: [Int]
      evenNums = take 10 (filter even [43..])
  print evenNums
  print (sum evenNums)

  putStrLn "Hello, everybody!"
  putStrLn ("Please look at my favorite odd numbers: " ++ show (filter odd [10..20] :: [Int]))

  let double :: Int -> Int
      double x = x + x
  print (double 2)
  let myMap f list =
        case list of
            [] -> []
            x : xs -> f x : myMap f xs
  print (myMap double [1,2,3])