{-
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it
may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
-}

import Data.List (nub)
import Data.Char (digitToInt)

main = putStrLn $ show fractions

fractions = filter isIncorrect . filter nonEqual . filter haveSameDigits . filter lessThenOne $ fractions -- Applicative functors can be useful here

isIncorrect (n, d) = nonTrivial && dr /= 0 && toRational n / toRational d == toRational nr / toRational dr
	where
		ns@[n1, n2] = show n
		ds = show d
		same = if n1 `elem` ds then n1 else n2
		nonTrivial = digitToInt same /= 0
		nr = digitToInt $ filter (/= same) ns !! 0
		dr = digitToInt $ filter (/= same) ds !! 0

haveSameDigits (n, d) = 3 == length (nub digits)
	where digits = show n ++ show d

lessThenOne (n, d) = n < d

nonEqual (n, d) = n /= d && n1 /= n2 && d1 /= d2
	where
		[n1, n2] = show n
		[d1, d2] = show d

fractions = do
	n <- [10..99]
	d <- [10..99]
	return (n, d)