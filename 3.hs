
import Data.List
import System.IO


-- This will accept an Int and an Int and out put an Int
addMe :: Int -> Int -> Int
-- funcName param1 param2 = operations (returned value)
addMe x y = x + y
sumMe x y = x + y
addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x,y) (x2,y2) = (x+x2, y+y2)
-- 
whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You can drink"
whatAge x = "Nothing important"
-- Factorial 
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


-- Lambdas : create a function that doesn't have a name
dbl1To10 = map (\x -> x * 2) [1..10]

-- Conditionals
-- Comparison ops < > <= >= == /=
-- Logical ops && || not
doubleEvenNumber y =
    if (y `mod` 2 /= 0)
        then y
        else y * 2

getClass :: Int -> String
getClass n = case n of
    5 -> "Go to K"
    6 -> "Go to Elem"
    _ -> "Go away"   --this is for anythign that isn't 5 or 6

-- Modules
{-}
module SampFunctions (getClass, doubleEvenNumber) where
import SampFunctions -- to load this
-}


--            Using and creating custom Data Types


data BaseBallPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | OutField
                deriving Show

barryBonds :: BaseBallPlayer -> Bool
barryBonds OutField = True
barryInOf = print(barryBonds OutField) --comes back TRUE

-- So you can have multiple vals consisting of Two Strings and a Double
data Customer = Customer String String Double
    deriving Show

tomSmith :: Customer
tomSmith =  Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

data RPS =  Rock | Paper | Scissors
shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Beats Rock"
shoot Rock Scissors = "Rock Beats Scissors"
shoot Scissors Paper = "Scissors Beat Paper"
shoot Scissors Rock = "Scissors Loses to Rock"
shoot Paper Scissors = "Paper Loses to Scissors"
shoot Rock Paper = "Rock Loses to Paper"
shoot _ _ = "Error"

-- Shapes Data Type Exmaple
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
    deriving Show

area :: Shape -> Float
-- to excec this do: area (Circle 50 60 20)
area (Circle _ _ r) = pi * r ^ 2
--                           (abs (x2 - x)) can be written as
--                           (abs $ x2 - x)
-- means anything that comes after the $ has presidence
-- over what is before it
area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs ( y2 - y))
-- This, (below) is the same as
sumValue = putStrLn (show (1 + 2))
-- this VVV
sumValue2 = putStrLn . show $ 1 + 2

areaOfCircle = area (Circle 50 60 20)
areaOfRect =  area $ Rectangle 10 10 100 100

{-
-- !!!!!!!!!!!!!!!!!!!!   TYPE CLASSES   !!!!!!!!!!!!!!!!!!!!
- Remember: To find a type and what it does just do
    :t TypeHere
- and you'll get this
    (+) :: Num a => a -> a -> a
    Any type a , that is an instance of class Num, then we can add it
-}
data Employee = Employee { 
    name :: String,
    postion :: String,
    idNum :: Int
}  deriving (Eq, Show)
samSmith = Employee {name = "Sam Smith", postion = "Manager", idNum = 1000}
pamMarks = Employee {name = "Pam Smith", postion = "Sales", idNum = 1001}
isSamPam = samSmith ==  pamMarks

samSmithData = show samSmith

data ShirtSize = S | M | L
instance Eq ShirtSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False

instance Show ShirtSize where
    show S = "Small"
    show M = "Medium"
    show L = "Large"
--    x `elem` [x,y,z] checks if x is in the list [x,y,z]
smallAvail = S `elem` [S, M, L]
theSize = show S

class MyEq a where
    areEqual :: a -> a -> Bool

instance MyEq ShirtSize where
    areEqual S S = True
    areEqual M M = True
    areEqual L L = True
    areEqual _ _ = False

newSize = areEqual M M -- returns True since M & M are the same size

sayHello = do
    putStrLn "What's your name?"
    name <- getLine
    putStrLn $ "Hello " ++ name

writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile ("lolz! youz is bad at Haskell! ¯|_(ツ)_|¯ ")
    hClose theFile

readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStr contents
    hClose theFile2

-- 1:13:30 in video
fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]
-- 1,1,2,3,5,8,...
{-
1st: fib = 1 and (tail fib) = 1
[1,1,2] : a : 1 + b: 1 = 2
2nd: fib = 1 and (tail fib) = 2
[1,1,2,3] : a : 1 + b: 2 = 3
-}
fib300 = fib !! 300 -- gives 300th elem in fib seq
take 20 fib         -- gives frist 20 elems in the fib seq