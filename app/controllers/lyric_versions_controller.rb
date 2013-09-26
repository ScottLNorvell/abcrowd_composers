class LyricVersionsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :update] 
	


	def show
		@lyric_version = LyricVersion.find params[:id]
		@lyric_lines = @lyric_version.lines_in_order
		@lyric = @lyric_version.lyric 
	end

	def showjs
		@lyric_version = LyricVersion.find params[:lyric_version]
		@lyric_lines = @lyric_version.lines_in_order
		@lyric = @lyric_version.lyric 
	end

	def create
		lyric = Lyric.find params[:lyric_id] 
		lyric_version = LyricVersion.new #params[:lyric_version]
		lyric_version.lyric_line_ids = params[:lyric_lines]
		
		lyric_version.save
		lyric_version.title = "#{current_user.email.split('@')[0].capitalize}'s version (#{lyric_version.id})"
		
		lyric.lyric_versions << lyric_version

		redirect_to lyric_version_path lyric_version
	end

	def update
		
	end

	def like
		@lyric_version = LyricVersion.find params[:id]
		@lyric_version.likes += 1
		if @lyric_version.save
			render 'like'
		else
			render nothing: true
		end
	end

end
