#SOLVED

# Ќекоторые числа обладают интересным свойством:
# 1233 = 12^2 + 33^2, 990100 = 990^2 + 100^2.
# Ќайти наибольшее 8-значное число ABCDEFGH такое, что ABCDEFGH=ABCD^2+EFGH^2.

class PowerPlusSolver
	def solve

		99999999.downto(10000000) do |num|
			return num if check(num)
		end
	end
	
	def check num
		a = num/10000
		b = num - a*10000

		return false if (a%2 == 1 && b%2 == 1)
		a*a+b*b == num
	end
end

if __FILE__ == $0
	s = PowerPlusSolver.new
	num = s.solve
	puts "Answer is #{num}"
end
