class LyricsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :update]
	

	include LyricFun


	def show
		@lyric = Lyric.find params[:id]
		@lyric_version, @versions_for_select = @lyric.versions_for_select
		@lyric_lines = @lyric_version.lines_in_order
	end

	def new
		@lyric = Lyric.new
		@topic = Topic.find params[:id]
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
