class CubeSolver
	def solve
		x = 0
		for a in 1..21
			for b in 1..21
				if a + y.abs <= 2009
					count += 1
				end
			end
		end
		puts "Count is #{count}"
	end
end

if __FILE__ == $0
	sv = CubeSolver.new
	sv.solve
end