class LyricsController < ApplicationController
	
	def show
		@lyric = Lyric.find params[:id]
		@lyric_version = @lyric.definitive_version
		@lyric_lines = @lyric_version.lines_in_order
	end

	def new
		@lyric = Lyric.new
		@topic_id = params[:id]
	end

	def create
		lyric = Lyric.create params[:lyric]
		lyric_version = lyric.lyric_versions.create title: 'Initial Version'
		make_lines( params[:text], lyric_version )

		redirect_to lyric_path lyric
	end

	def update
		
	end

	private

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
