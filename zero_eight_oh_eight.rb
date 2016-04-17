class ZeroEightOhEight
	attr_reader :time
	def input
		puts 'How bright a time?'
		@t = gets.chomp.tr(':','')
		if @t =~ /([01]\d|2[0-3]):?([0-5]\d)/
			b = 0
			@t.each_char { |c| b += lookup(c.to_i) }
			puts "Brightest you are on the minute!" if b == 26
			puts "You timeguessing DIM WIT! #{b}" unless b == 26 || b == 8	
			puts "Thou lovest darkness!"	if b == 8	
		else
		  puts "Sorry wrong timezone ..." 
		end	
	end

	def lookup(d)
		case d
		when 0,6,9 then	6
		when 1     then	2
		when 2,3,5 then	5
		when 4     then	4
		when 7     then	3
		when 8     then	7
		else
			puts "What number between 0 and 9 are you testing, DIM WIT?"
			0
		end		
	end
end