# Найдите сумму всех натуральных чисел N<109, которые делятся на 11 и N/11 равно сумме квадратов цифр N.

class EleventhSolver
	
	def solve

		curr = 1
		n = 11
		while n < 1000000000
			
			chastnoe = n/11
			
			summ = square_digits_summ n.to_s

			if chastnoe == summ
				puts "Good N is #{n}"
			end
				
			if n >= 10**curr
				puts "Current N is #{n}"
				$stdout.flush
				curr += 1
			end
			n += 11
		end
	end
	
	def square_digits_summ number
		summ = 0
		number.each_char do |sdig|
			dig=sdig.to_i
			summ += dig*dig
		end
		summ
	end
	
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0
	
    tm = time {
		s = EleventhSolver.new
		s.solve
	}

	puts "Time is #{tm}"
end
