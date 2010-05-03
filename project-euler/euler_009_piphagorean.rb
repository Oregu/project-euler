# Пифагоровы числа - это тройка натуральных чисел a, b, c, такая, что a2 + b2 = c2. 
# Известно, что a, b, c - пифагоровы числа, a < b < c и a + b + c = 11000. 
# Чему равно минимальное произведение a*b*c?

class PiphagoreanSolver

	def solve summ
		
		1.upto(summ) do |c|
			1.upto(c) do |b|

				a = summ - b - c				
				next if a <= 0 or a >= b
				next if a*a + b*b != c*c

				puts "Here is the one: #{a} * #{b} * #{c} = #{a*b*c}"
			end
		end
	end
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	s = PiphagoreanSolver.new
	takes = time do 
		s.solve 11000
	end
	puts takes
end
