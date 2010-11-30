#!/usr/bin/env ruby

class Prime

	attr_reader :primes_table

	def initialize
		@primes_table = []
	end

	def load_primes_upto to
    @upto = to
		@primes_table = eratosthenes_sieve @upto
	end

	def each
		@primes_table.each do |p|
			yield p
		end
	end

	def flush minOne, maxOne
		primes = get_prime_list maxOne
		
		File.open 'primes.pr', 'w' do |prime_file|
		
			primes.each do |prime|
				prime_file.puts prime if prime > minOne
			end			
		end
	end

	def get_prime_list maxOne
		primes = []
		prime_sequence maxOne do |p|
			primes.push p
		end
		primes
	end

	def get_prime_divisors num # Still can be improved (p.e. don't do each prime)
		sqrt = Math.sqrt num
		sqrt = sqrt.floor

		primes = @primes_table if @primes_table.length != 0
		primes = eratosthenes_sieve sqrt if @primes_table.length == 0
		
		divs = []
		
		primes.each do |prime_div|

			while (num%prime_div).zero?

				divs.push prime_div
				yield prime_div if block_given?
				
				num = num/prime_div
				return divs if num == 1

			end
		end

		divs.push num
		divs
	end

	def get_prime_divisors_w_powers num # Still can be improved
		divs = get_prime_divisors num
		ans = {}
		divs.each { |div| ans[div] = (ans[div].nil?) ? 1 : ans[div] + 1 }
		ans
	end

	def prime_sequence maxOne # Too slow!
		primes = [2, 3]
		
		yield 2
		yield 3
		
		candidate = 5
		inc = 2
		index = 1
		while candidate <= maxOne
			
			itsPrime = true
			while primes[index]*primes[index] <= candidate
				if (candidate%primes[index]).zero?
					itsPrime = false
					break;
				end
				index += 1
			end
			
			if itsPrime then
				yield candidate
				primes.push candidate
			end
			
			candidate += inc
			index = 1
			if inc == 2 then inc = 4 else inc = 2 end
		end
	end

	def eratosthenes_sieve maxnum
		primes = (1..maxnum).to_a
		primes[0] = 0
		sqrt = Math.sqrt(maxnum).floor
		result = []
		
		(1..sqrt).each do |d|
			p = primes[d-1]
			next if p.zero?
			
			if block_given? then yield p else result.push p end
			
			((p**2)..maxnum).step(p) do |div|
				primes[div-1] = 0
			end
		end
		
		(sqrt+1..maxnum).each do |i|
			p = primes[i-1]
			next if p.zero?
			
			if block_given? then yield p else result.push p end
		end
		result
	end
		
	def Prime.is_prime num

    return false if num <= 1
    return false if (num%2).zero?
		return false if (num%3).zero?
    
		del = 5
    while del*del <= num do
      return false if (num%del).zero?
      del += 2
    end
        
    true
  end

	def get_proper_divisors num # Still can be improved

#		def divisorGen(n):
#			factors = list(factorGenerator(n))
#			nfactors = len(factors)
#			f = [0] * nfactors
#			while True:
#				yield reduce(lambda x, y: x*y, [factors[x][0]**f[x] for x in range(nfactors)], 1)
#				i = 0
#				while True:
#					f[i] += 1
#					if f[i] <= factors[i][1]:
#						break
#					f[i] = 0
#					i += 1
#					if i >= nfactors:
#						return

		divs = []
		factors = (get_prime_divisors_w_powers num).to_a
		nfactors = factors.length
		powers = Array.new(nfactors, 0)
		
		while true
			factor = ((0..nfactors-1).to_a.collect {|x| factors[x][0]**powers[x]}).inject(1) {|x, acc| x*acc}
			divs.push factor
			i = 0
			while true
				powers[i] += 1
				break if powers[i] <= factors[i][1]
				powers[i] = 0
				i += 1
				return divs if i >= nfactors
			end
		end
	end

  def index pr
    raise if @primes_table.empty? || pr > @upto

    low = 0
    high = @primes_table.length - 1
    
    while low <= high
      mid = (low + high) >> 1
      midVal = @primes_table[mid]
      
      if midVal < pr
        low = mid + 1
      elsif midVal > pr
        high = mid - 1
      else
        return mid
      end
    end

    nil
  end

end

def time
  start = Time.now
  yield
  Time.now - start
end

if __FILE__ == $0

	p = Prime.new
  p.load_primes_upto 1000000
  
  puts p.index 971

#	maxprime = 1000000

#	s1 = 0
#	s2 = 0
		
#	takes1 = time { p.eratosthenes_sieve(maxprime) { |p| s1 += p } }
#	puts "S1 = #{s1}"
	
#	takes2 = time { p.prime_sequence(maxprime) { |p| s2 += p } }
#	puts "S2 = #{s2}"
	
#	puts "So it take times: \n\t\
#		Eratosthenes Sieve: #{takes1} \n\t\
#		By finding divisors: #{takes2}"

#	puts p.get_prime_divisors 1036

#	puts p.get_prime_list 1009
#	s.flush 1, 10**5

#    puts Prime.is_prime 1013
	puts "Done"

end
