class PalindromeSolver

	def find_palindromes
		pali = []
		(100..999).each do |a|
			(100..999).each do |b|

				next if not is_palindrome a*b
				pali.push a*b
				puts a,b if a*b == 906609
			end
		end
		pali
	end
	
	def is_palindrome num
		s = num.to_s
		return true if s[0] == s[5] and s[1] == s[4] and s[2] == s[3]
		false
	end
	
end

if __FILE__ == $0

	s = PalindromeSolver.new
	pal = s.find_palindromes

	puts "Palindromes is #{pal.max}"
	puts
end
