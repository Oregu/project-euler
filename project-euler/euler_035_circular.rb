# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# 
# How many circular primes are there below one million?

require "../util/prime"

class CircularPrimes

	def initialize
		@primes = Prime.new
		@primes.load_primes_upto 1_000_000
	end

	def solve
		count = 0
		bound = 1
		@primes.each do |pr|
			bound *= 10 if pr > bound*10
			count += 1 and puts pr if circular?(pr, bound)
		end
		count
	end

	def circular? num, bound
		n = roll_num(num, bound)
		while n != num
			return false if @primes.index(n).nil?
			n = roll_num(n, bound)
		end
		true
	end

	def roll_num num, bound
		num/10 + (num%10)*bound
	end
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	cl = nil
	t_init = time { cl = CircularPrimes.new }
	ans = 0
	t_solve = time { ans = cl.solve }

	puts "Sum is: #{ans}"
	puts "Init time is: #{t_init} and solve time is #{t_solve}"
end
