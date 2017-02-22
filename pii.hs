module Main where

import Control.Monad (replicateM)

type Order = (Int,Int,Int,Int)

main :: IO ()
main = do
    k <- readLn
    orders <- replicateM k (fmap readOrder getLine)
    printResults orders
    --mapM print orders

readOrder :: String -> Order
readOrder s = (b,e,t,m)
  where
    [b,e,t,m] = map read (words s)

-- TODO write a function that computes the minimum number of boxes needed to pack an order
pack :: Order -> Int
pack (b,e,t,m)
    | n <= b = n
    | otherwise = -1
  where n = addToBoxes (b,e,t,m) 20 0

addToBoxes :: Order -> Int -> Int -> Int
addToBoxes (b,e,t,m) s n
    | s>=6 && e>0 = addToBoxes (b,e-1,t,m) (s-6) n
    | s>=3 && t>0 = addToBoxes (b,e,t-1,m) (s-3) n
    | s>=1 && m>0 = addToBoxes (b,e,t,m-1) (s-1) n
    | s==0        = addToBoxes (b,e,t,m) (20) (n+1)
    | s<3 && m==0 = addToBoxes (b,e,t,m) (20) (n+1)
    | s<6 && t==0 = addToBoxes (b,e,t,m) (20) (n+1)
    | s<20        = addToBoxes (b,e,t,m) (20) (n+1)
    | otherwise   = n

checkBoxes :: Order -> String
checkBoxes o | n == -1   = "Need more boxes"
             | otherwise = ("Pack "++show n++" boxes")
           where n = pack o

printResults :: [Order] -> IO ()
printResults     [] = return ()
printResults (s:ss) = do
    putStrLn (checkBoxes s)
    printResults ss