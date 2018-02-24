import Data.List
import System.IO

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