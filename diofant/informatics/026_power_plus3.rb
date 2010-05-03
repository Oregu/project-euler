# Найти наименьшее натуральное число n для которого 2n + 3 делится на простое число 625406681329.

class PowerPlusSolver

    def solve
		big = 625406681329
		while true
			bits = (big-3).to_s(2)
#			puts bits
			if bits.count("1") == 1
				puts "N is #{big}"
				return
			end
			
			big += 625406681329*2
		end
	end

end

if __FILE__ == $0
	s = PowerPlusSolver.new
	s.solve	
end
