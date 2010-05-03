# SOLVED! Реализовать почисловое сложение!

# Work out the first ten digits of the sum of the following 
# one-hundred 50-digit numbers.

# Here is one hack:
# Since the required answer to this problem only requires
# the first 10 digits of the sum, there is absolutely no need to add more
# than the first 11 digits of each of the 100 numbers,
# yielding a 13-digit number. Adding the 12th++ digits
# could never affect more than the 11th digit of the sum.
# ( or use doubles ;) )

class Summator

	def summ howmany
		s = 0
		f = File.open "euler_013_numbers.txt"		
		f.each {|line| s += line[0..howmany+1].to_i }
		puts "Answer: ", s.to_s[0..howmany]
	end
end

if __FILE__ == $0
	s = Summator.new
	s.summ 10
	puts
	puts "Done"
end
