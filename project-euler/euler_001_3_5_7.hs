count xs = sum [ x | x <- xs, 
					x `mod` 3 /= 0, x `mod` 5 /= 0, x `mod` 7 /= 0 ]

answer = count [1..1000]