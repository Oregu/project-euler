#SOLVED!
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters
# and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

class NumberToString

	def initialize
		@str_numbers = []
		@str_numbers_to_20 = []
		@str_numbers_10 = []
		
		@str_numbers << ""
		
		@str_numbers.concat %w{ one two three four five six seven eight nine }
		@str_numbers_to_20.concat %w{ ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen }		
		@str_numbers_10 = %w{ twenty thirty forty fifty sixty seventy eighty ninety }

		@str_hundred = @str_numbers.collect { |x| x + "hundred" }
		@str_thousand = @str_numbers.collect { |x| x + "thousand" }
	end

	def getnumstr num, pos
		return @str_numbers[num] if pos == 0 and num != 0
		return @str_numbers_to_20[num - 10] if pos == 1 and num > 9 and num < 20
		return @str_numbers_10[num - 2] if pos == 1 and num != 0
		return @str_hundred[num] if pos == 2 and num != 0
		return @str_thousand[num] if pos == 3 and num != 0
		""
	end

	def translateEn number
		answer = []
		num = number
		tens = num % 100
		d = 0

		if tens > 9 and tens < 20
			d += 1
			answer << getnumstr(tens, d)
			num /= 100
		else
			tens = num%10
			answer << getnumstr(tens, d)
#			answer << " "
			num /= 10			
			d += 1

			tens = num%10
			answer << getnumstr(tens, d)
			num /= 10
		end

		answer << "and" if not (number%100).zero? and number > 100

		until num == 0
#			answer << " "
			d += 1
			tens = num % 10
			answer << getnumstr(tens, d)
			num /= 10
		end

		answer.reverse.join
	end

end

if __FILE__ == $0

	ntos = NumberToString.new
	cnt = 0
	1.upto(1000) do |i|
		s = ntos.translateEn i
		puts s
		cnt += s.length
	end
	puts cnt
	puts ntos.translateEn 342
	
end
