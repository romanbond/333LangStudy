import Data.List
import System.IO

--             Data Types
-- Int -2^63 63^2
maxInt = maxBound :: Int
-- Integer
-- Float
-- Double
-- Bool : True or Flase
-- Char '_'
-- Tuple : List made up of many different data types

--              Haskell Math
sumOfNums = sum [1..1000]
addEx =  5 + 5
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4
modEx = mod 5 4
modEx2 = 5 `mod` 4
negNumEx = 5 + (-4)
-- :t sqrt
-- sqrt :: Floating a => a -> a
num9 = 9 :: Int
sqrtOf9 = sqrt ( fromIntegral num9)
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999
-- Also sin, cos, asin, atan, acos, sinh, tanh, asinh, atanh, acosh
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)
-- :t (+)
-- (+) :: Num a => a -> a -> a
-- *Main> :t truncate
-- truncate :: (Integral b, RealFrac a) => a -> b

--               Lists
primeNumbers = [3,5,7,11]
morePrimes2 = primeNumbers ++ [13,17,19,23,29]
favNums = 2 : 7 : 21 : 66 : []
multList = [[3,5,7],[11,13,17]]
lenPrime = length morePrimes2
revPrime = reverse morePrimes2
isListEmpty = null morePrimes2
secondPrime = morePrimes2 !! 1
firstPrime = head morePrimes2
lastPrime = last morePrimes2
primeInit = init morePrimes2  -- everything but last number
first3Primes =  take 3 morePrimes2
removedPrimes = drop 3 morePrimes2
is7InList = 7 `elem` morePrimes2
maxPrime = maximum morePrimes2
minPrime = minimum morePrimes2
newList = [2,3,5]
prodPrimes = product newList
zeroToTen = [0..10]
evenList = [2,4..20]
letterList = ['A', 'C'..'Z']
infinPow10 = [10,20..]
many2s = take 10 (repeat 2) --list of 10 2's
many3s = replicate 10 3
cycleList = take 10 (cycle [1,2,3,4,5])
listTimes2 = [x*2 | x <- [1..10]]
listTimes3LessThan50 = [x*3 | x <- [1..10], x*3<= 50]
divisBy9N13 = [ x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
sortedList = sort [4,6,3,6,9,7,2]
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
listBiggerThan5 =  filter (>5) morePrimes2
evensUpTo20 = takeWhile (<= 20) [2,4..]  -- even though [2,4..] makes an infinite list it only goes up to 20
multOfList = foldl (*) 1 [1,2,3,4,5] -- the L in foldl measn left to right
multOfListRight = foldr (*) 1 [1,2,3,4,5]

-- List Comprehension

pow3List = [3^n | n <- [1..10]]  -- takes each element in the list, times it by 3 and puts it back in the list
multTable = [[x*y | y <- [1..10]] | x<- [1..10]]
randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith",52)
bobsName = fst bobSmith
babsAge = snd bobSmith
names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "324 North", "567 South"]
namesNAddress = zip names addresses

-- Functions
main = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn ("Hello " ++ name)


