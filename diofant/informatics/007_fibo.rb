class FiboSolver
	def solve
		fib = fibonacci 10**18
		puts "Fibonacci is #{fib}"
		puts "Div of fibonacci by 952301267 is #{fib%952301267}"
	end
	
	def fibonacci n=2
		if n <= 1 
			return n
		end
		
		fn = 0
		fn1 = 1
		i = 2
		while i <= n
			fn2 = fn + fn1
			
			i += 1
			fn = fn1
			fn1 = fn2
		end
		
		fn1
	end
end

if __FILE__ == $0
	s = FiboSolver.new
	s.solve
end
