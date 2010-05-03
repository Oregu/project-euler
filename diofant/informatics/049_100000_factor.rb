#SOLVED!

# Найти наименьшее число n, такое что n! имеет в конце 1000000 нулей.

class FactSolver

	def solve		
		
		cnt = 0
		n = 0		
		until cnt > 999999
			n += 5
			cnt += count_divs_5 n
		end
		n
	end
	
	def count_divs_5 num
		fvs = 0
		while true
			break if num % 5 != 0
			num /= 5
			fvs += 1
		end
		fvs
	end

	def fact n
		return 1 if n == 0
		return n * fact(n-1)
	end
	
end

if __FILE__ == $0
	s = FactSolver.new
	n = s.solve
	puts "N is #{n}"
end
