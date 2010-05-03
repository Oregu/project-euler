#!/usr/bin/env ruby

class FactorialSolver

	def calc
	
		ans = 19*(9**4)*(9**15+1) + 
			3*17*19*(9**5)*(9**12 + 12*9**10 + 4*13*9**8 + 6*13*9**4 + 2*14*9**2 + 4) + 
			2*11*13*17*19*9**11 + 9
			
		puts "Calc says\t #{ans}"	
	end
  
	def fact(n)
		if n == 0
			1
		else
			n * fact(n-1)
		end
	end
	
	def comb(n, m)
		fact(n)/(fact(m)*fact(n-m))
	end
	
	def var_repeat(n, m)
		n**m
	end

	def check

		ans = 0
		20.times do |i|
			next if i % 2 == 0
			ans = ans + comb(19, i) * var_repeat(9, 20-i)
		end
		
		puts "And check says\t #{ans}"	
	end
end


if __FILE__ == $0

  mg = FactorialSolver.new
  mg.calc
  mg.check

end