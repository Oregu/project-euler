{-
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.
The product 7254 is unusual, as the identity, 39x186 = 7254,
containing multiplicand, multiplier, and product is 1 through 9 pandigital.
Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
-}

import Data.List (nub)

main = putStrLn $ show solve

solve = (sum . nub . map fst3) pandigitals
	where fst3 (a, _, _) = a

pandigitals = [(prod, a, b) | a <- [1..999], b <- [a..9999], let prod = a*b, isPandigit a b prod]

isPandigit a b p = (not $ elem '0' digs) && length digs == 9 && (length . nub) digs == 9
	where digs = show a ++ show b ++ show p

{-
This runs half a minute with runhaskell command.
It's sooo unoptimized...
And 999 and 9999 numbers were entered by guess.
It's should be much faster to run through all pandigital numbers and see if they make a product... probably. 
-}