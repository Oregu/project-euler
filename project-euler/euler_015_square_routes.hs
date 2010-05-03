-- Answer is Pascal's triangle middle numbers: for 3x3 its C_3_6, for 5x5 its C_5_10
-- Which is C_k_n = n!/(n-k)!*k! = (2k)!/k!*k!

solve = product [2..80] `div` product [2..40]^2
