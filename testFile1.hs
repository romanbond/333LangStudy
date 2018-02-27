import Data.List
import System.IO

revList :: [a] -> [a]
revList [] = []
--revList (x:[]) = [x]
revList (x:xs) = revList (xs) ++ [x]

appList :: [a] -> [a] -> [a]
appList [] [] = []
appList [x] ys = x:ys
appList [] ys = ys
appList (x:xs) ys = x : appList xs ys

twoTimes :: [Int] -> [Int] -> [Int] 
twoTimes xs ys = (map (\x -> x * 2) xs) ++ (map (\y -> y * 2) ys)