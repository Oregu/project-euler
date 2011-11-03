{-
An irrational decimal fraction is created by concatenating the positive integers:
0.123456789101112131415161718192021...
It can be seen that the 12th digit of the fractional part is 1.
If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
-}

import Char (digitToInt)

main = print solve

solve = product $ map digitToInt $ map ((concat $ map show [1..]) !!) [0, 9, 99, 999, 9999, 99999, 999999]

