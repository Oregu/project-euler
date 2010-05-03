# Найти максимальное произведение 6 последовательных цифр в 1000-значном числе:
# Find the greatest product of five consecutive digits in the 1000-digit number.

class MaxProduxtSolver

	attr_accessor :maxstr, :maxsum

	def initialize filename, howmuch
		@filename = filename
		@maxsum = 0
		@maxstr = ""
		@howmuch = howmuch
	end

	def load
		file = File.new(@filename, "r")
		summ_str = ""
		
		if file
			file.each_line do |line|
				summ_str += line.strip
			end
			summ_str
		else
			puts "Can't open file"
			""
		end
	end
	
	def solve
		digit = load

		digits = digit.split "0"
		digits.each do |strnum|

			next if strnum.length < @howmuch
			breakonsix strnum
		end
		get_str_product @maxstr
	end

	def breakonsix str
		0.upto(str.length-@howmuch) do |from|
			summ = get_str_sum str[from..from+@howmuch-1]
			@maxsum, @maxstr = summ, str[from..from+@howmuch-1] if summ > @maxsum
		end
	end
	
	def get_str_product strnum
		p = 1
		strnum.each_char do |c|
			p *= c.to_i
		end
		p
	end
	
	def get_str_sum strnum
		s = 0
		strnum.each_char do |c|
			s += c.to_i
		end
		s
	end
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	s = MaxProduxtSolver.new "euler_008_matrix.txt", 6
	takes = time do
		prod = s.solve
		puts s.maxstr
		puts prod
	end
	puts takes
end
