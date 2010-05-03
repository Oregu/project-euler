# Сколько нужно табличек с буквами (на каждой табличке одна буква),
# чтобы одновременно выложить названия всех чисел от 0 до 999?

class NumberToString

	def initialize
		@str_numbers = ["один", "два", "три", "четыре", "пять", "шесть", "семь", "восемь", "девять"]
		@str_numbers_to_20 = ["десять", "одиннадцать", "двенадцать", "тринадцать", "четырнадцать",
								"пятнадцать", "шестнадцать", "семнадцать", "восемнадцать", "девятнадцать"]
		@str_numbers_10 = ["двадцать", "тридцать", "сорок", "пятьдесят", "шестьдесят", "семьдесят", "восемьдесят", "девяносто"]
		@str_numbers_100 = ["сто", "двести", "триста", "четыреста", "пятьсот", "шестьсот", "семьсот", "восемьсот", "девятьсот"]
	end

	def getnumstr num, pos
		return @str_numbers[num-1] if pos == 0 and num != 0
		return @str_numbers_to_20[num - 10] if pos == 1 and num > 9 and num < 20
		return @str_numbers_10[num - 2] if pos == 1 and num != 0
		return @str_numbers_100[num-1] if pos == 2 and num != 0
		""
	end

	def translate number
		answer = []
		num = number
		tens = num % 100
		d = 0

		if tens > 9 and tens < 20
			d += 1
			answer << getnumstr(tens, d)
			num /= 100
		else
			tens = num%10
			answer << getnumstr(tens, d)
#			answer << " "
			num /= 10			
			d += 1

			tens = num%10
			answer << getnumstr(tens, d)
			num /= 10
		end

#		answer << "and" if not (number%100).zero? and number > 100

		until num == 0
#			answer << " "
			d += 1
			tens = num % 10
			answer << getnumstr(tens, d)
			num /= 10
		end

		answer.reverse.join
	end

end

if __FILE__ == $0

	ntos = NumberToString.new
	cnt = 0
	File.open("euler_017_print.txt", 'w') do |f|
		1.upto(1000) do |i|
			s = ntos.translate i
			f.puts(s)
			cnt += s.length
		end
		f.puts(cnt)
		f.puts(ntos.translate 342)
	end

end
