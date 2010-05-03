# Рассмотрим натуральное десятизначное число.
# Такое число назовем самоописывающимся, если выполнены следующие условия: 
# первая цифра равна числу единиц в записи числа, 
# вторая цифра равна числу двоек в записи числа, и.т.д. 
# Девятая цифра равна числу девяток в записи числа. 
#
# Таких чисел существует всего десять. Чему равна сумма их квадратов?

class SelfDesribeClass
	
	def solve		
		for num in 1000000000..9999999999
			
            if num%1000000000 == 0 || 
               num%1100000000 == 0 || 
               num%1010000000 == 0 || 
               num%1001000000 == 0 || 
               num%1000100000 == 0 || 
               num%1000010000 == 0 then 
                
                puts num; 
                $stdout.flush 
            end
            
			if self_described? num
				puts "#{num} is self described"
				$stdout.flush
			end
		end
	end
	
	def self_described? num
		return false
		
		num_hash = Hash[1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0]
		snum = num.to_s
		snum.each_byte do |b|
			b = b - 48
			if b == 0 then next end
			num_hash[b] += 1
		end
		
		num_hash.each do |k, v|
			if snum[k-1].to_i != v then
				return false
			end
		end
		true
	end
	
end

if __FILE__ == $0
	s = SelfDesribeClass.new
	puts s.solve
#	puts s.self_described? "1214967890"
end
