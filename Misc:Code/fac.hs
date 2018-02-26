fac :: Integer -> Integer
fac n
  | n < 0      = error "factorial of negative argument"
  | n == 0    = 1
  | otherwise = fac' n 1
    where
      fac' 1 acc = acc
      fac' k acc = fac' (k-1) $! k*acc







