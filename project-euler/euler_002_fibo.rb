#!/usr/bin/env ruby

# SOLVED!
# ������� ��� ����� ���������: 1, 1, 2, 3, 5, 8, 13, 21,... 
# (������ ��������� ���� ���� ����� ����� ���� ����������, ���������� ��� � ���� ������). 
#
# ����� ����� ������ ����� ����, ������� ������ ��������� � ����������� �� �������� ��������.

class FiboSolver
	
	def fibo till
		fn = 0
		fn1 = 1

		while fn1 < till
		
			fn2 = fn + fn1

			yield fn1

			fn = fn1
			fn1 = fn2
		end
	end
end

if __FILE__ == $0

f = FiboSolver.new
s = 0
i = 0

f.fibo(10**9) do |fn|
	i += 1
	puts "#{fn} (#{i})"
	s += fn if not (i%2).zero?
end

puts
puts "For Diofant S=#{s}"
puts

s = 0
f.fibo(4*10**6) do |fn|
	s += fn if (fn%2).zero?
end

puts "For Euler S=#{s}"
puts

end
