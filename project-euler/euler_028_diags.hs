{-

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

-}

-- With analysis I came up with a formula
-- k = 0..499, j = 1..4, 1+sum_k(4*(2*k+1)^2 + sum_j(2*j*(k+1))) or
-- k = 0..499, 1+sum_k(4*(2*k+1)^2 + 20(k+1))

answer = 1 + sum [4*(2*k+1)^2 + 20*(k+1) | k <- [0..499]]

main = print answer

