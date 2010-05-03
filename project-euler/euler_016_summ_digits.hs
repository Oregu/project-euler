solve n = foldr (+) 0 $ map Data.Char.digitToInt $ show $ 2^n

-- Or w/o foldr => sum $ map Data.Char.digitToInt $ show $ 2^n
