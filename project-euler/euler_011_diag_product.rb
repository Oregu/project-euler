# In the 20x20 grid below,
# four numbers along a diagonal line have been marked in red.
# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

# What is the greatest product of four adjacent numbers in any direction
# (up, down, left, right, or diagonally) in the 20×20 grid?

class DiagonalProductSolver
	
	def initialize filename, len=4
		@filename = filename
		@len = len
		@digits = []
		@max = 0
		@maxstr = ""
	end
	
	def load
		file = File.open @filename
		file.each do |line|
			@digits << (getDigs line)
		end
	end

	def getDigs line
		line.split.collect! { |n| n.to_i }
	end
	
	def solve
		load
		h = @digits.size
		w = @digits[0].size
		
		0.upto(h-@len) do |by_h|
			0.upto(w-@len) do |by_w|
				analyze by_h, by_w
			end
		end
		
		analyze_last_square h-@len, w-@len
		
		puts @max
	end

	def analyze pivot_h, pivot_w
		prod_h = prod_w = prod_dl = prod_dr = 1
		
		0.upto(@len-1) do |i|
			prod_h *= @digits[pivot_h][pivot_w+i]
			prod_w *= @digits[pivot_h+i][pivot_w]
			prod_dl *= @digits[pivot_h+i][pivot_w+i]
			prod_dr *= @digits[pivot_h+@len-1-i][pivot_w+i]
		end
		@max = [@max, prod_h, prod_w, prod_dl, prod_dr].max
	end

	def analyze_last_square pivot_h, pivot_w
		
		0.upto(@len-1) do |i|
			prod_h = prod_w = 1
			0.upto(@len-1) do |j|
				prod_h *= @digits[pivot_h+j][pivot_w+i]
				prod_w *= @digits[pivot_h+i][pivot_w+j]
			end			
			@max = [@max, prod_h, prod_w].max			
		end
	end
end

if __FILE__ == $0
	
	s = DiagonalProductSolver.new "euler_011_diag_product.txt", 5
	s.solve
	puts "Done"
end
