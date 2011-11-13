{--
  145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
  Find the sum of all numbers which are equal to the sum of the factorial of their digits.
  Note: as 1! = 1 and 2! = 2 are not sums they are not included.
--}

module Main where

import Char (digitToInt)


main = print solve

solve = sum $ filter isFactSum [10..100000]

isFactSum n = n == (sum $ map factorial [[1..m]| m <- digs n])

digs = map digitToInt . show

factorial = product

-- Oneliner
solve2 = sum $ filter (\n -> n == (sum $ map product [[1..m]| m <- map digitToInt $ show n])) [10..100000]

solveDiofant =  product $ filter (\n -> n == (sum $ map product [[1..m]| m <- map digitToInt $ show n])) [1..100000]
