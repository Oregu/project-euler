# Запишите кубы натуральных чисел подряд:
# 1 8 27 64 125...
# Какие цифры находятся на миллионной и следующей позициях? (Введите обе цифры в том порядке, как они встречаются в записи без всяких разделителей.)

class CubeSolver
	def solve
		count = 0
		i = 1
		while count < 1000000
			cb = i**3 
			
			count += cb.to_s.length
			i += 1
		end
		
		puts "Cube=#{cb};digits count=#{count}"
	end
end

if __FILE__ == $0
	s = CubeSolver.new
	s.solve
end
