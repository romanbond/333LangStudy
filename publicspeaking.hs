main :: IO ()
main = do --return () //you only use this when you need the main to compile and return nothing so that you don't have the main error
    x <- readLn --fmap read getLine basically the same as the one before
    ss <- getTranscripts x
    checkTranscripts ss


getTranscripts :: Int -> IO [String] --int to list of strings
getTranscripts 0 = return []
getTranscripts n = do 
    s <- getLine
    ss <- getTranscripts (n-1) --recursively reads the rest of the remining input
    return (s:ss) --our list is returned
    --String -> [String] -> [String]  --ss is going to be a list of list of strings
    --a -> [a] -> [a]

checkTranscripts :: [String] -> IO ()
checkTranscripts     [] = return ()
checkTranscripts (s:ss) = do
    putStrLn (checkTranscripts s)
    checkTranscripts ss


checkTranscript :: String -> String
checkTranscript s | n > 5     = "nervous"
                  | otherwise = "calm"
  where n = countFiller (words s) -- gives a list of strings

-- need a function to count how many filler words are in a list of strings ("um' "uh"
-- things like that etc) so we need a function to identify the filler words

countFiller :: [String] -> Int
countFiller      [] = 0 --recursively defined by a base case
countFiller (w:ws) 
    | isFiller w = n+1 --use guards for if then else
    | otherwise  = n
  where
    n = countFiller ws --common coding style in hs

isFiller :: String -> Bool
--we could use pattern matching here, use recursion and no loops
isFiller "er" = True
isFiller "um" = True
isFiller "uh" = True -- this whole function is called a partial function caause it's non exhuastive
isFiller   _  = False



