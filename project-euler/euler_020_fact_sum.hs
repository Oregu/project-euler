import Data.Char
answer x = foldr ((+) . digitToInt) 0 $ show . fac $ x
	where fac n = product [1..n]