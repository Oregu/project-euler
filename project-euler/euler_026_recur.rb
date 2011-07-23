class RecurCycle

  def solve till
    max = 0
	mx = 0
	mi = 0
	mf = 0
	mr = 0
	1.upto(till) do |x|
	  i, f, r = div_by(1, x)
	  unless r.nil?
		l = r.to_s.length
		max = l and mx = x and mi = i and mf = f and mr = r if l > max
	  else
		puts "#{i},#{f} has no recurring cycle"
	  end
	end
	puts "1/#{mx}=#{mi},#{mf}(#{mr}) has max recurring cycle"
	mx
  end

  def div_by a, b
	a_digs = a.to_s.split('').map {|a| a.to_i }

	int_p = []
	num = a_digs[0]
	1.upto(a_digs.size - 1) do |i|
	  int_p << 0 if a_digs[i].zero?
	  num = num*10 + a_digs[i]
	  next if num < b
	  q = num.div(b)
	  int_p << q
	  num -= q*b
	end

	qs = []
	float_p = []
	until num.zero? do
	  num *= 10
	  float_p << 0 and next if num < b
	  q = num.div b
	  ind = qs.index(num) ######### WRONG ##########
	  break unless ind.nil?
	  qs << num
	  float_p << q
	  num -= q*b
	  break if float_p.size > 1000
	end

	recr_p = float_p[ind, float_p.size] unless ind.nil?

	[recr_p ? "0" : int_p.to_s, float_p.to_s.sub(/0$/, ''), recr_p && recr_p.to_s.sub(/0$/, '')]
  end

end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

  rc = RecurCycle.new
#  i, f, r = rc.div_by(1, 27)
#  puts "#{i},#{f} (#{r})"
  puts rc.solve(999), "has max cycle"
end
