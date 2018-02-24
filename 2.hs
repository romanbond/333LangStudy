import Data.List
import System.IO

-- This will accept an Int and an Int and out put an Int
addMe :: Int -> Int -> Int
-- funcName param1 param2 = operations (returned value)
addMe x y = x + y
sumMe x y = x + y
addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x,y) (x2,y2) = (x+x2, y+y2)

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You can drink"
whatAge x = "Nothing important"

factorial :: Int -> Int

factorial 0 = 1
factorial n = n * factorial (n - 1)

prodFact n = product [1..n]

-- Guards
isOdd :: Int -> Bool
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age 
    | (age >= 5) && (age <= 6) = "Kindergarten"
    | (age >= 6) && (age <= 10) = "Elem School"
    | (age >= 10) && (age <= 14) = "Middle School"
    | (age >= 14) && (age <= 18) = "High School"
    | otherwise = "Go to College"

batAvgRating :: Double -> Double -> String
batAvgRating hits atBats 
    | avg <= 0.200 = "Terrible Batting avg"
    | avg <= 0.250 = "Avg Player"
    | avg <= 0.280 = "You're doing pretty good"
    | otherwise = "You're an allstar"
    where avg = hits / atBats

getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) =  "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ " and then " ++ show xs

getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]

-- Higher Order Functions
times4 :: Int -> Int
times4 x = x * 4 
listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs
{-
How this recurssion works
[1,2,3,4,5] : x = 1 | xs = [2,3,4,5]
[2,3,4,5] : x = 2 | xs = [3,4,5]
[3,4,5] : x = 3 | xs = [4,5]
and so on...
-}

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False

-- Passing a func into a func
-- means we expect a function to be passed inside **this** function and then return an integer
-- This is at 53:10 on video
doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4

threePlusList = map adds3 [1,2,3,4,5]



