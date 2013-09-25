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
			format.js { render 'create' }
		end
	end

	def next_line

		current_line = LyricLine.find params[:id]

		next_line = LyricLine.where("lyric_id = #{current_line.lyric_id} and order_number = #{current_line.order_number} and version_number = #{current_line.version_number + 1}").first

		@lyric_line = next_line

		respond_to do |format|
			format.html { redirect_to request.referer }
			format.js 
		end
	end

	def previous_line
		current_line = LyricLine.find params[:id]

		previous_line = LyricLine.where("lyric_id = #{current_line.lyric_id} and order_number = #{current_line.order_number} and version_number = #{current_line.version_number - 1}").first

		@lyric_line = previous_line

		respond_to do |format|
			format.html { redirect_to request.referer }
			format.js
		end
	end



end
