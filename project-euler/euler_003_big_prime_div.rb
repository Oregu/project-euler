#!/usr/bin/env ruby

# SOLVED
# Ќайти наибольший простой делитель числа 386745374779148463746059.

require "../util/prime"

class PrimeDividerSolver
    
	def solve num
		primes = []
		p = Prime.new
		p.get_prime_divisors(num) do |pr|
			primes.push pr
		end
		primes
	end

end

if __FILE__ == $0

	NUMBER = 386745374779148463746059 #600851475143

	bfg = PrimeDividerSolver.new
	primes = bfg.solve NUMBER

	puts
	puts "Prime Dividers are #{primes}"
	puts

end
