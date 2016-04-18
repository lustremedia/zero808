class ZeroEightOhEight
	def input
		puts 'How bright a time? (Format: 23:59 or 2359)'
		@t = gets.chomp.tr(':','')
		calc_brightness(@t)
	end

	def autofind
		24.times { |h| 60.times { |m| calc_brightness("#{"%02d" % h}#{"%02d" % m}") }	}
	end

	def calc_brightness(time)
		if time =~ /([01]\d|2[0-3])[0-5]\d/ && time.length == 4
			b = 0
			time.each_char { |c| b += lookup(c.to_i) }
			puts "#{time}: Brightest, You are on TIME! #{b}" if b == 26
			puts "#{time}: You time guessing DIMWIT! #{b}" unless b == 26 || b == 8
			puts "#{time}: Thou lovest DARKNESS! #{b}"	if b == 8
		else
		  puts "Sorry wrong timezone ... DIMWIT!" 
		end		
	end

	def lookup(d)
		case d
		when 1     then	2
		when 7     then	3
		when 4     then	4
		when 2,3,5 then	5
		when 0,6,9 then	6
		when 8     then	7
		else
			0
		end		
	end
end