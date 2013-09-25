class LyricVersionsController < ApplicationController
	
	def show
		@lyric_version = LyricVersion.find params[:id]
		@lyric_lines = @lyric_version.lines_in_order
	end

	def create
		
	end

	def update
		
	end
end
