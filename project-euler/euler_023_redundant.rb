# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is
# less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers
# greater than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis
# even though it is known that the greatest number that cannot be expressed
# as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written
# as the sum of two abundant numbers.

require "../util/prime"
require "../util/combi"
require "set"

class AbundantSum

	MAX_AB = 28123

	def initialize
		@primes = Prime.new
		@primes.load_primes_upto MAX_AB
		@field = (2..MAX_AB).to_a
		@field = @field - @primes.primes_table
		@primes.load_primes_upto Math.sqrt(MAX_AB).floor
	end

	def solve
		abun = []
		@field.each do |n|
			s = 0
			(@primes.get_proper_divisors n).each do |x|
				s += x if x != n
				if s > n
					abun << n
					break
				end
			end
		end

		sums = Set.new
		c = Combination.new		
		c.each_pair abun do |pair|
			s = pair[0] + pair[1]
			sums << s if s < MAX_AB
		end
		
		all = Set.new (24..(MAX_AB-1)).to_a
		(all - sums).inject {|x,acc| x+acc }
	end

end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	cl = AbundantSum.new
	ans = 0
	t_solve = time { ans = cl.solve }

	puts "Sum is: #{ans}"
	puts "Solve time is #{t_solve}"
end
