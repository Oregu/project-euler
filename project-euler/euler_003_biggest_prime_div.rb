require "../util/prime"

class PrimeDividerSolver

  NUMBER = 386745374779148463746059

  def solve
    (3..10).each do |a|
      next if NUMBER%a != 0

      puts "Checking #{NUMBER}/#{a}"
      div = NUMBER/a

      return div if Prime.is_prime div
    end
        
    0
  end
end

if __FILE__ == $0

  s = PrimeDividerSolver.new
  divdr = s.solve

  puts "No answer" if divdr == 0
  puts "BPD is #{divdr}" if divdr != 0
  puts
end
