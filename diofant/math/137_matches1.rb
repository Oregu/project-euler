#!/usr/bin/ruby

mc = 111
puts "There is #{mc} matches on the table"
player = 'A'

while mc > 0 do
  print "#{mc} matches left\t\t#{player}: "
  move = gets.chomp.to_i
  mc -= move
  break if mc <= 0
  player = if player == 'A' then 'B' else 'A' end
end

puts "Player #{player} won!"