
import Data.List
import System.IO

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

