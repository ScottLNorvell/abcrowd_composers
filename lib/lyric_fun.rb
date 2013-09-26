module LyricFun
	
	def make_lines(text, lyric_version)
		lines = text.split( /\r\n|\r|\n/ )		
		i = 100
		lines.each do |line|
			lyric_version.lyric_lines << LyricLine.new( text: line, 
																									order_number: i, 
																									lyric_id: lyric_version.lyric_id )
			i += 100
		end
		lyric_version.save
	end

	def get_next_version(lyric_line)
		versions = LyricLine.where("lyric_id = #{lyric_line.lyric_id} and order_number = #{lyric_line.order_number}")
		if versions.any?
			version_numbers = versions.map { |version| version.version_number }
			version_numbers.max + 1
		else
			0
		end
	end

	def get_middle_value(first, second)

		first += (second - first)/2

	end
	
end