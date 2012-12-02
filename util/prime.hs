module Prime where

isPrime x = (x > 1) && (null $ filter (\y -> x `mod` y == 0) $ takeWhile (\y -> y*y <= x) [2..])
