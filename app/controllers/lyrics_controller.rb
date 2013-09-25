class LyricsController < ApplicationController
	include LyricFun


	def show
		@lyric = Lyric.find params[:id]
		@lyric_version = @lyric.definitive_version
		@lyric_lines = @lyric_version.lines_in_order
		@topic = @lyric.topic
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

	# Here we will update with likes, etc
	def update
		
	end
	
end
