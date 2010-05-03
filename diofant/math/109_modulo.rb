class ModuloSolver
	def solve
		count = 0
		for x in -2010..2010
			for y in -2010..2011
				if x.abs + y.abs <= 2009
					count += 1
				end
			end
		end
		puts "Count is #{count}"
	end
end

if __FILE__ == $0
	sv = ModuloSolver.new
	sv.solve
end