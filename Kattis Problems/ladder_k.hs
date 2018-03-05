import Data.List
import System.IO

main :: IO ()
main = interact (showResult . doTheWork . parseInput)

parseInput :: String -> [Float]
parseInput = (map read.words)

-- This [Float] wil convert the list of int into a list of float
doTheWork :: [Float] -> Int
doTheWork [wall, angle] = ceiling (1/sin(angle * (pi/180)) * wall)

showResult :: Int -> String
showResult x = (show x) ++ "\n"  -- show is basically the toString func


--  need to add ceiling func to the final answer 