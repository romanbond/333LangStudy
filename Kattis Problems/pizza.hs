-- Roman Bond
-- CMPT 333
-- 3/1/18

main :: IO ()
main = interact (showResult . doTheWork . parseInput)

parseInput :: String -> [Float]
parseInput = (map read.words)

doTheWork :: [Float] -> Float
doTheWork [r,c] = (1-(pi*((r^2)-((r-c)^2)))/(pi*(r^2)))*100

showResult :: Float -> String
showResult x = (show x) ++ "\n"




