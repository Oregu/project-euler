#!/usr/bin/env ruby

class NaturalSolver

  def try
	sum = 0.0
	10000000.times do |a|
	  x = a + 1
	  sum += 1.0/x.to_f
	end
	printf "Sum is %30.10f", sum
	
  end
  
end


if __FILE__ == $0

  mg = NaturalSolver.new
  mg.try

end