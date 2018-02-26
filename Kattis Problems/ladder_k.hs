import Data.List
import System.IO

readInts :: IO [Int]
readInts = fmap (map read.words) getLine

main :: IO ()
main = do
    x <- readInts
    let wall = x!!0
    let angle = x!!1
    let ans = sin(fromIntegral angle) * fromIntegral wall  
    -- Haskell, by default, uses radians for the sin function
    -- Figure out how to convert degrees to radians and then you're done
    print ans