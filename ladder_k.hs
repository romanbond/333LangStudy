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
    print ans
--              This is basically done but I don't know the right eq
