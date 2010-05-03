# Из ряда натуральных чисел от 1 до 2009 вычеркнули все нечётные числа.
# Из оставшихся вычеркнули числа, стоявшие на нечётных местах.
# Эту процедуру повторяли до тех пор, пока не осталось только одно число.
# Найдите его.

if $0 == __FILE__
  
  arr = (1..2009).to_a
  arr.delete_if { |x| x.odd? }

  while arr.length != 1
    carr = arr.clone
    carr.each_index do |ind|
      arr.delete carr[ind] if (ind+1).odd?
    end
  end

  puts arr

end