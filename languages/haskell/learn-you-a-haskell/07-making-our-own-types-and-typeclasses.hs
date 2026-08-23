-- Algebraic data types

data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ (2 :: Int)
surface (Rectangle x1 y1 x2 y2) = abs (x2 - x1) * abs (y2 - y1)

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
