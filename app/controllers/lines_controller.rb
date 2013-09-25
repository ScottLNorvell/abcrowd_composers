class LinesController < ApplicationController
	
	def new
		@lyric_line = LyricLine.find params[:id]

		respond_to do |format|
			format.html { redirect_to request.referer }
			format.js
		end

	end 

	def create
		@lyric_line = LyricLine.create params[:lyric_line]

		respond_to do |format|
			format.html { redirect_to request.referer }
			format.js
		end
	end

	def next_line
		current_line = LyricLine.find params[:id]



		respond_to do |format|
			format.html { redirect_to request.referer }
			format.js
		end
	end

	def previous_line
		@lyric_line = LyricLine.find params[:id]

		respond_to do |format|
			format.html { redirect_to request.referer }
			format.js
		end
	end



end
