# The following iterative sequence is defined for the set of positive integers:

# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 - 40 - 20 - 10 - 5 - 16 - 8 - 4 - 2 - 1

# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), 
# it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

class CollatzProblemSolver
	
	def solve under
		max = 0
		max_step_num = 0
		
		under.downto(1) do |num|
			cs = collatz_steps num
			max, max_step_num = cs, num if cs > max
		end
		print "number: ", max_step_num, " steps: ", max
		puts
		max
	end

	def collatz_steps number
		num = number
		steps = 0

		until num == 1
			steps += 1
#			print num, " - "
			if num.even? then num = num/2 else num = num+num+num + 1 end
		end
#		puts "1"
		steps+1
	end
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0	
	s = CollatzProblemSolver.new
	
	takes = time { s.solve 2_000_000 }
	
	puts takes, "Done"
end
