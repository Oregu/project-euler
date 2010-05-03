#!/usr/bin/env ruby

# Незакончено, работает неправильно, должен генерировать размещения.

class Combination
		
	def generate list, by = nil

		len = list.length
		
		if by.nil?
			res = []
			0.upto(len) do |i|
				res.concat generate(list, i)
			end
			return res
		end

		return [] if by == 0 or by > len
		return list.collect { |x| [x] } if by == 1
		return [list] if by == len

		comb = []

		0.upto(len-by+1) do |i|
			start = []
			
			range = i..(i+by-2)
			range.each do |k|
				start << list[k]
			end

			(0).upto(len-1) do |j|
				next if range.include? j
				el = Array.new start
				el << list[j]
				comb << el
			end
		end

		comb
	end
	
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	c = Combination.new
	print c.generate [2, 2, 3, 5, 5], 4
	print (c.generate [2, 2, 3, 5, 5]).collect {|x| x.inject(1) {|res, item| res*item }}.uniq
	puts "\nDone"

end
