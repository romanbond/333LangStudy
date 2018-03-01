import Data.List
import System.IO

revList :: [a] -> [a]
revList [] = []
--revList (x:[]) = [x]  we don't need this
revList (x:xs) = revList (xs) ++ [x]

appList :: [a] -> [a] -> [a]
appList [] [] = []
appList [x] ys = x:ys
appList [] ys = ys
appList (x:xs) ys = x : appList xs ys

twoTimes :: [Int] -> [Int] -> [Int] 
twoTimes xs ys = (map (\x -> x * 2) xs) ++ (map (\y -> y * 2) ys)

data Employee = Employee { name :: String,	
						   position :: String,
						   idNum :: Int 
						   } deriving (Eq, Show)				   
samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 1000}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 1001}
isSamPam = samSmith == pamMarx
samSmithData = show samSmith
data ShirtSize = S | M | L
instance Eq ShirtSize where
	S == S = True
	M == M = True
	L == L = True
	_ == _ = False