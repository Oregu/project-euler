# Using names.txt  (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names,
# begin by sorting it into alphabetical order. Then working out
# the alphabetical value for each name, multiply this value
# by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN,
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
# So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

class FileNamesSum

	def initialize filename
		@filename = filename
		load
	end

	def load
		file = File.open @filename
		file.each do |line|
			@names = line.split (/","/)
			@names[0].delete! "\""
			@names[@names.length-1].delete! "\""
		end
	end

	def solve
		@names.sort!
		ind = 0
		@names.inject(0) {|acc, name| ind += 1; acc + ind * name_score(name) }
	end
	
	def name_score name
		acc = 0
		name.each_byte {|c| acc = acc + c - 64 }
		puts acc if name == "COLIN"
		acc
	end

end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	cl = nil
	t_init = time { cl = FileNamesSum.new "euler_022_names.txt" }
	ans = 0
	t_solve = time { ans = cl.solve }

	puts "Sum is: #{ans}"
	puts "Init time is: #{t_init} and solve time is #{t_solve}"
end
