#!/usr/bin/env ruby

class DivsSolver

  # Создать объект
  def initialize
    @START = 299999999999999
#	@STEP =                9
	@DIV =              1237
  end

  def solve
		
    (1..@START.to_s.length-1).each do |six_place|
	  (1..@START.to_s.length-1).each do |eight_place|
	    
		if six_place == eight_place 
		  next
		end
		
		current = @START.to_s
		current[six_place] = "6"
		current[eight_place] = "7"

#		puts current
		
		if current.to_i % @DIV == 0
		  puts "Answer is #{current}"
		  puts "Digits sum is #{dsum(current)}"
		  break
		end
	  end
	end

  end
  
  def dsum(c)
    summ = 0
	while c != 0
	  summ += c%10
	  c = c/10
	end
	summ
  end
  
end

if __FILE__ == $0

  mg = DivsSolver.new
  mg.solve

end