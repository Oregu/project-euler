# Let d(n) be defined as the sum of proper divisors of n
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair
# and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10_000 

# (для Диофанта < 1_000_000).

require "../util/prime"

class AmicableSum

	def initialize to
		@primes = Prime.new
		@upto = to

		@primes.load_primes_upto @upto # Math.sqrt(@upto).floor
		@field = (2..@upto).to_a - @primes.primes_table
		@primes.load_primes_upto Math.sqrt(@upto).floor
	end

	def solve
		big_sum = 0
		2.upto(@upto) do |n|
			sum = (@primes.get_proper_divisors n).inject {|x, acc| acc+x } - n
			next if sum < n
			next if sum >= @upto
			sec_sum = (@primes.get_proper_divisors sum).inject {|x, acc| acc+x } - sum
			big_sum += (n+sum) if sec_sum == n and n != sum
#			print n, "=", sum, "  (#{@primes.get_proper_divisors n})", "\n" if sec_sum == n and n != sum
		end
		big_sum
	end

end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	cl = nil
	t_init = time { cl = AmicableSum.new 100_000 }
	ans = 0
	t_solve = time { ans = cl.solve }

	puts "Sum is: #{ans}"
	puts "Init time is: #{t_init} and solve time is #{t_solve}"
end
