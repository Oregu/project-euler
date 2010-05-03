# SOLVED PS ������� �����, ����� ���� �����

# ���� ����� ������������ �������� �������������� ������������ �� ���������,
# ����������� ������������ �������, ������� 1 ��������?

class PiphagoreanSolver
	
	def solve to
		max = 0
		(to/2).downto(to/3) do |c|

			c2 = c*c
			(c-1).downto(to/3) do |b|				
				
				next if b+c > to-3
				a = Math.sqrt(c2-b*b)
				
				next if a != a.round
				a = a.round
				
				next if a >= b
				p = a+b+c

				next if p >= to || p < max
				
				max = p if p > max
				print a," + ",b," + ",c," = ",p,"\n" if p == max

			end
		end
		max
	end
end

if __FILE__ == $0
	s = PiphagoreanSolver.new
	puts s.solve 1000_000
end

# �� �����
# ����������� ����� �������:

# ����� x,y,z - ������� ��������� ������������� (� ������� ��� ������� - ����������� ����� � �� �������������)

# �������� ������, ��� � ����������� ������ (x,y,z) ����� x � y ����� ������ ��������. 
# ����� ����������� ���������� ������ (x,y,z), ��� x - �������, � y - �����, 
# ���������� �������������� � ���� (m*m-n*n, 2mn, m*m+n*n) - � ���� �������� ����������� ������ ;)
