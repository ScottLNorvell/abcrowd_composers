module ApplicationHelper
	
	def get_heading
		heading = "ABCrowdComposers"

		if subject = session[:subject]
			heading += "::#{subject}"

			if topic = session[:topic]
				heading += "::#{topic}"
			end 
		end

		return heading
	end

	def get_second_line(lyric_lines, line)
		i = lyric_lines.index(line)

		next_line = lyric_lines[ i + 1 ]

		if next_line
			next_line.order_number
		else
			line.order_number + 50
		end

	end
	
end
