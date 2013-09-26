class LyricVersionsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :update, :like] 
	


	def show
		@lyric_version = LyricVersion.find params[:id]
		@lyric_lines = @lyric_version.lines_in_order
		@lyric = @lyric_version.lyric 
	end

	def create
		lyric_version = LyricVersion.new params[:lyric_version]

		lyric_version.lyric_line_ids = params[:lyric_lines]

		lyric_version.save

		redirect_to lyric_version_path lyric_version

	end

	def update
		
	end

	def like
		@lyric_version = LyricVersion.find params[:id]
		
		@lyric_version.likes += 1

		@lyric_version.save
	end

end
