# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

# Solution description
# It turns out that:
# abcdefg >> a^5 + b^5 + c^5 + d^5 + e^5 + f^5 + g^5 >> 6*9^5 = 354294
# as well as 100000 abcdef >> a^4 + b^4 + c^4 + d^4 + e^5 + f^5 >> 5*9^4 = 32805

class FifthSum

  def solve
	ans = []
	(10).upto(354294) do |a| # <-- How to find this upper bound ????
	  if is_fifth_sum a
		ans << a
		puts a
	  end
	end
	return ans.inject(:+)
  end

  def is_forth_sum a
	a == digits(a).inject(0) {|sum, n| sum + n*n*n*n }
  end

  def is_fifth_sum a
	a == digits(a).inject(0) {|sum, n| sum + n*n*n*n*n }
  end

  def digits a
	a.to_s.split('').map {|a| a.to_i }
  end
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0
  qf = FifthSum.new
  ans = qf.solve
  puts "Answer is #{ans}"
end
