-- Algebraic data types

data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ (2 :: Int)
surface (Rectangle x1 y1 x2 y2) = abs (x2 - x1) * abs (y2 - y1)

data Point = Point Float Float deriving (Show)
data Shape' = Circle' Point Float | Rectangle' Point Point deriving (Show)

surface' :: Shape' -> Float
surface' (Circle' _ r) = pi * r ^ (2 :: Int)
surface' (Rectangle' (Point x1 y1) (Point x2 y2)) = abs (x2 - x1) * abs (y2 - y1)

nudge :: Shape' -> Float -> Float -> Shape'
nudge (Circle' (Point x y) r) a b = Circle' (Point (x+a) (y+b)) r
nudge (Rectangle' (Point x1 y1) (Point x2 y2)) a b = Rectangle' (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

-- Record syntax

-- Type params

-- Derived instances

-- Type synonyms

-- Recursive data structures

-- Typeclasses 102

-- A yes-no typeclass

-- The Functor typeclass

-- Kinds

main :: IO ()
main = do
    -- Algebraic data types
    print $ surface $ Circle 10 20 10
    print $ surface $ Rectangle 0 0 100 100
    print $ Circle 10 20 5
    print $ Rectangle 50 230 60 90
    print $ map (Circle 10 20) [4,5,6,6]
    print $ surface' $ Rectangle' (Point 0 0) (Point 100 100)
    print $ surface' $ Circle' (Point 0 0) 24
    print $ nudge (Circle' (Point 34 34) 10) 5 10

    -- Record syntax
    putStr ""

    -- Type params
    putStr ""

    -- Derived instances
    putStr ""

    -- Type synonyms
    putStr ""

    -- Recursive data structures
    putStr ""

    -- Typeclasses 102
    putStr ""

    -- A yes-no typeclass
    putStr ""

    -- The Functor typeclass
    putStr ""

    -- Kinds
    putStr ""
