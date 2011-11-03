{-
  The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
  Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
  (Please note that the palindromic number, in either base, may not include leading zeros.)
-}
import Numeric (showIntAtBase)
import Char (intToDigit)

main = print solve

solve = sum $ filter isDoublePalindromic [1, 3..999999]

isDoublePalindromic n = isPalindrome n && isBinPalindrome n

toBin d = showIntAtBase 2 intToDigit d ""

isBinPalindrome = isStrPalindrome . toBin 

isPalindrome = isStrPalindrome . show

isStrPalindrome s = reverse s == s
