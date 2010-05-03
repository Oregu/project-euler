# SOLVED!!!

# Гипотеза Гольдбаха, которая до сих пор является не решённой проблемой, заключается в следующем: 
# Любое чётное число большее двух можно представить в виде суммы двух простых чисел.
# Оказывается, что для небольших чётных чисел такое представление не только существует, но их существует достаточно много. Например, число 20130 можно представить в виде суммы двух различных простых чисел 512 способами.
# Требуется найти наименьшее натуральное чётное число, которое можно представить в виде суммы двух различных простых чисел ровно 1024 способами.

class PrimeCountSolver
		
	def solve
		num = 20130
		primes = load_prime_list
		while num <= 20130**3
			cnt = get_prime_variants_count num, primes
			if cnt > 1000
				puts "Count of #{num} is #{cnt}"
			end
			
			if cnt == 1024
				puts "The winner is #{num}"
				break
			end
			
			num += 2
			$stdout.flush
		end
	end
	
	def get_prime_variants_count number, primes
		count = 0

		primes.each_key do |prime|
			if primes.has_key?(number-prime)
				if prime * 2 > number then break end
				count += 1
			end
		end
		count
	end
	
	def load_prime_list	
		primes = Hash.new
		File.open 'primes.pr', 'r' do |prime_file|
			while line = prime_file.gets
				primes[line.to_i] = [line.to_i]
			end
		end
		primes
	end
	
end

if __FILE__ == $0
	s = PrimeCountSolver.new
	s.solve
end
