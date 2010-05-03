#!/usr/bin/env ruby

class NaturalSolver

  def try
	
    9.times do |a|
        x = a + 1

        5.times do |b|
            st = 10**(b+15)
            y  = x*(st - 1)/19.0
            printf " %30.4f ; %1i : %20i\n", y, x, st
        end
    end

  end

end


if __FILE__ == $0

  mg = NaturalSolver.new
  mg.try

end