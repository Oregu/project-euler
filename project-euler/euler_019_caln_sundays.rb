# You are given the following information, but you may prefer to do some research for yourself.
#
#    * 1 Jan 1900 was a Monday.
#    * Thirty days has September,
#      April, June and November.
#      All the rest have thirty-one,
#      Saving February alone,
#      Which has twenty-eight, rain or shine.
#      And on leap years, twenty-nine.
#    * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

# Сколько всего пятниц попадали на 13-е числа месяцев
# с 1 января 1901 года до 1 января 2001 года
# (с учетом современнного летоисчисления)?

class EulerCalendar
	
	def solve
		day = 1
		month = 1	# Current month
		year = 1900	# Current year for while condition
		count = 0	# How many sundays
		count_diof = 0 # How many fridays 13
		
		while month < 13
			day += mdays month, year
			month += 1
		end

		month = 1
		year += 1
		
		while year != 2001
			count += 1 if (day%7) == 0
			count_diof += 1 if ((day+13)%7) == 5

			day += mdays month, year

			month += 1
			year += 1 if month > 12
			month = 1 if month > 12
		end
		[count, count_diof]
	end
	
	def mdays mnth, year
		return 30 if (mnth == 4 or mnth == 6 or mnth == 9 or mnth == 11)
		return days_in_feb year if (mnth == 2)
		31
	end
	
	def days_in_feb year
		return 28 if year.odd?
		return 29 if (year%400).zero?
		return 28 if (year%100).zero?
		return 29 if (year%4).zero?
		28
	end
end

if __FILE__ == $0

	cl = EulerCalendar.new
	ans = cl.solve
	puts "Sundays on first: #{ans[0]}"
	puts "Fridays 13: #{ans[1]}"
end
