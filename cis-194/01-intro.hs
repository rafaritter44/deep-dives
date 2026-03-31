main :: IO ()
main = do
    let lst = [1,2,3] :: [Int]
    print (sum (map (3*) lst))

    let x :: Int
        x = 3
    print x

    let _y :: Int
        _y = _y + 1
    putStrLn "_y results in an infinite recursion"

    let smallestInt, biggestInt :: Int
        smallestInt = minBound
        biggestInt = maxBound
    print (smallestInt, biggestInt)

    let big :: Integer
        big = 1234567890987654321987340982334987349872349874534
    print big

    let reallyBig :: Integer
        reallyBig = 2^(2^(2^(2^2)))
    let numDigits :: Int
        numDigits = length (show reallyBig)
    print numDigits

    let d1, d2 :: Double
        d1 = 4.5387
        d2 = 6.2831e-4
    print (d1, d2)

    let b1, b2 :: Bool
        b1 = True
        b2 = False
    print (b1, b2)

    let c1, c2, c3 :: Char
        c1 = 'x'
        c2 = 'Ø'
        c3 = 'ダ'
    print (c1, c2, c3)

    let s :: String
        s = "Hello, Haskell!"
    putStrLn s

    print (mod 19 3 :: Int)
    print (19 `mod` 3 :: Int)
    print ((-3) * (-7) :: Int)
    print (8.7 / 3.1 :: Double)
    print (div 12 5 :: Int)
    print (12 `div` 5 :: Int)

    print ('a' == 'a')
    print (16 /= 3)
    print ((5 > 3) && ('p' <= 'q'))
    print ("Haskell" > "C++")

    let sumtorial :: Integer -> Integer
        sumtorial 0 = 0
        sumtorial n = n + sumtorial (n-1)
    print (sumtorial 3)

    let isEven :: Integer -> Bool
        isEven n
            | n `mod` 2 == 0 = True
            | otherwise      = False
    let hailstone :: Integer -> Integer
        hailstone n
            | isEven n  = n `div` 2
            | otherwise = 3*n + 1
    print (hailstone 1, hailstone 2)

    let foo :: Integer -> Integer
        foo 0 = 16
        foo 1
          | "Haskell" > "C++" = 3
          | otherwise         = 4
        foo n
          | n < 0           = 0
          | n `mod` 17 == 2 = -43
          | otherwise       = n + 3
    print (foo 0, foo 1, foo (-1), foo 19, foo 20)