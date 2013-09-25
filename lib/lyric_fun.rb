module LyricFun
	
	def make_lines(text, lyric_version)
		lines = text.split /\r\n|\r|\n/
		i = 100
		lines.each do |line|
			lyric_version.lyric_lines << LyricLine.new( text: line, 
																									order_number: i, 
																									lyric_id: lyric_version.lyric_id )
			i += 100
		end
		lyric_version.save
	end
	
end