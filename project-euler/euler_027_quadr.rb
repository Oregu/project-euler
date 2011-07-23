# Euler published the remarkable quadratic formula:
# n^2 + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
# However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
# and certainly when n = 41, 41? + 41 + 41 is clearly divisible by 41.
#
# Using computers, the incredible formula  n?  79n + 1601 was discovered,
# which produces 80 primes for the consecutive values n = 0 to 79.
# The product of the coefficients, 79 and 1601, is 126479.
#
# Considering quadratics of the form:
#
# n^2 + an + b, where |a|  1000 and |b|  1000
# (where |n| is the modulus/absolute value of n; e.g. |11| = 11 and |4| = 4)
#
# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n, starting with n = 0.

require '../util/prime'

class QuadraticFormula

  def initialize max_val
	@max_val = max_val
	@primes = Prime.new
	@primes.load_primes_upto @max_val
  end

  def solve
    max_a, max_b = 0, 0
	max_n = 0
	
	(-@max_val).upto(@max_val) do |a|
	  @primes.each do |b|
		n = maxval a, b
		if n > max_n
			max_a, max_b = a, b
			max_n = n
		end

		n = maxval a, -b
		if n > max_n
			max_a, max_b = a, b
			max_n = n
		end
	  end
	end
	return max_a, max_b, max_n
  end

  def maxval a, b

	n = 0
	while true
	  v = get n, a, b
	  break unless Prime.is_prime v
	  n += 1
	end

	n - 1
  end

  def get n, a, b
	n*n + a*n + b
  end

end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0
  qf = QuadraticFormula.new 999
#  puts qf.maxval(1, 41), "is max value, still producing consecutive prime values"
  a, b, n = 0, 0, 0
  t = time { a, b, n = qf.solve }
  puts "(#{a}, #{b}) are coefficients producing max consecutive prime values - #{n}"
  puts "Solved in #{t}"
end
