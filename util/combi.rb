#!/usr/bin/env ruby

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

	def each_pair coll
		len = coll.size
		pairs = []
		0.upto(len-1) do |i|
			(i).upto(len-1) do |j|
				yield [coll[i], coll[j]]
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

	c = Combination.new
#	print c.generate [2, 2, 3, 5, 5], 2
	print c.pairs [2, 3, 4, 5, 6]
#	print (c.generate [2, 2, 3, 5, 5]).collect {|x| x.inject(1) {|res, item| res*item }}.uniq
	puts "\nDone"

end
