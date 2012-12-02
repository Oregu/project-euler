{- SOLVED
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right,
and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
-}

import Prime
import Data.Char (digitToInt)
import Control.Monad (replicateM)

main = putStrLn $ show solve

solve = sum $ take 11 [p | l <- [2..], p <- candidates l, isTruncatable p]

candidates :: Int -> [Int]
candidates n = [sn + toInt rest | s <- [2,3,5,7], let sn = s * 10 ^ (n - 1), rest <- restDigits (n - 1)]
	where
		toInt = foldl addDigit 0
   		addDigit num d = 10*num + d

-- Generates combinations of specified length...
-- TODO need to know how it works.
-- replicateM is a short for (sequence . replicate l)
restDigits l = replicateM l [1,3,7,9]

isTruncatable p = all isPrime $ removedDigits p

removedDigits :: Int -> [Int]
removedDigits p = fromEnd p ++ fromStart p
	where
		fromEnd = takeWhile (/= 0) . iterate (`div` 10)
		fromStart = drop 1 . takeWhile (> 0) . iterate minusFirstDigit
		minusFirstDigit x = x - (firstDigit x) * 10^(-1 + powerOf x)
		firstDigit x = digitToInt $ (show x) !! 0
		powerOf = length.show
