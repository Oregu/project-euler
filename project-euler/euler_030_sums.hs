{-
 Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

 1634 = 14 + 64 + 34 + 44
 8208 = 84 + 24 + 04 + 84
 9474 = 94 + 44 + 74 + 44
 As 1 = 14 is not a sum it is not included.

 The sum of these numbers is 1634 + 8208 + 9474 = 19316.

 Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
-}

{-
 Solution description
 It turns out that:
 abcdefg >> a^5 + b^5 + c^5 + d^5 + e^5 + f^5 + g^5 >> 6*9^5 = 354294
 as well as 100000 abcdef >> a^4 + b^4 + c^4 + d^4 + e^5 + f^5 >> 5*9^4 = 32805
-}

{-
  And here is Haskell one liner from the forum
  sum [x | x <- [2..1000000], x == (sum . map ((^5) . digitToInt) . show) x]
-}

import Data.Char (digitToInt)

main = putStrLn $ show ans ++ "\nsum = " ++ (show $ sum ans)
	where ans = solve

solve = filter fifthSum [10 .. 354294]

fifthSum n = n == (fifth $ digs n)

digs = map digitToInt . show

fifth = foldr (\a s -> s + a*a*a*a*a) 0
