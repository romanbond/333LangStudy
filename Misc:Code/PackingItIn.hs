module Main where

import Control.Monad (replicateM)

type Order = (Int,Int,Int,Int)

main :: IO [()]
main = do
     k <- readLn
     orders <- replicateM k (fmap readOrder getLine)
     mapM print orders

readOrder :: String -> Order
readOrder s = (b,e,t,m)
   where
     [b,e,t,m] = map read (words s)

-- TODO write a function that computes the minimum number of boxes needed to pack an order
pack :: Order -> Int
pack = undefined