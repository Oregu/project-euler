#!/usr/bin/env ruby

# SOLVED!
# Ќайти сумму всех натуральных чисел меньших 1000, каждое из которых не делитс€ ни на 3, ни на 5, ни на 7.

if __FILE__ == $0

s = 0
1.upto(1000) do |a|
	if (a%3 != 0 and a%5 != 0 and a%7 != 0) then
		s = s + a
		print "#{a} (#{s}) "
	end
end

puts "\nFor Diofant S=#{s}"

s = 0
1.upto(999) do |a|
	if (a%3).zero? or (a%5).zero? then
		s = s + a
		print "#{a} (#{s}) "
	end
end

puts "\nFor Euler S=#{s}"

end
