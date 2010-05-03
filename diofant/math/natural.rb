#!/usr/bin/env ruby

class NaturalSolver
  attr_accessor :biggest

  # Создать объект
  def initialize(biggest = 12)
    @biggest = biggest
  end

  # Поприветствовать всех
  def try
	
    1.upto(@biggest) do |a|
      1.upto(@biggest) do |b|
        check(a,b)
      end
    end
	
  end
  
  def check(a=1, b=1)
    
	should_be_cube = a**2 + b**2
	should_be_square = a**3 + b**3
	
	cbrt = should_be_cube ** (1/3.0)
	sqrt = Math.sqrt(should_be_square)
	
	if cbrt.round == cbrt && sqrt.round == sqrt
	  puts "#{a}, #{b}:\t squares sum = #{cbrt} (#{should_be_cube})\t cube_sum = #{sqrt} (#{should_be_square})"
	end
	
  end

end


if __FILE__ == $0

  mg = NaturalSolver.new
  mg.biggest = 1200
  mg.try

end