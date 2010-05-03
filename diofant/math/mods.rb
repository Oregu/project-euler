#!/usr/bin/env ruby

class ModsSolver

  # Создать объект
  def initialize(max = 1000000)
    @MAX = max
  end

  # Поприветствовать всех
  def solve_by_search_all
	
	mods_count = 0
	prev_mods_count = 0
    1.upto(@MAX) do |current|
	  mods_count = 0
	  sqrt = Math.sqrt(current)
	  1.upto(sqrt) do |div|
		if current % div == 0
		  mods_count += 1
		end
	  end
	  
	  if mods_count > prev_mods_count
		printf "%8.0f Mods count %4.0f\n", current, mods_count
		prev_mods_count = mods_count
	  end
	  current += 1
    end
	
  end
  
end


if __FILE__ == $0

  mg = ModsSolver.new
  mg.solve_by_search_all

end