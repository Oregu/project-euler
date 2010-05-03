# Чему равно наименьшее натуральное число меньшее 1 миллиона, которое имеет максимальное количество различных делителей.

class ModsSolver
  
  def initialize(max=1000000)
    @MAX = max
  end
  
  def solve_by_search_all

	current = 1
	mods_num = 0
	prev_mods_num = 0
	
	while current < @MAX
	  
	  mods_num = 0
	  sqr = Math.sqrt(current)
	  1.upto(sqr) do |md|
		if current % md == 0
		  mods_num += 1
		end
	  end

	  if mods_num > prev_mods_num
		printf "%6.0f: Mods count is %3.0f\n", current, mods_num
		prev_mods_num = mods_num
	  end

	  current += 1
	end
	
  end
  
end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

  ms = ModsSolver.new
  
  takes = time do
	ms.solve_by_search_all
  end
  
  puts takes
end
