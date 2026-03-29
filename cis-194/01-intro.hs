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

    let n :: Integer
        n = 1234567890987654321987340982334987349872349874534
    print n

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