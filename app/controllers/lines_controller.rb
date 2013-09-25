class LinesController < ApplicationController
	include LyricFun


	def new
		lyric_line = LyricLine.find params[:id]

		dump_form lyric_line
	end 

	def create
		lyric_line = LyricLine.new params[:lyric_line]

		lyric_line.version_number = get_next_version( lyric_line )

		lyric_line.save

		dump_line lyric_line
	end

	def next_line

		current_line = LyricLine.find params[:id]

		next_line = LyricLine.where("lyric_id = #{current_line.lyric_id} and order_number = #{current_line.order_number} and version_number = #{current_line.version_number + 1}").first

		if next_line
			dump_line next_line
		else
			dump_form current_line
		end
	end

	def previous_line
		current_line = LyricLine.find params[:id]

		previous_line = LyricLine.where("lyric_id = #{current_line.lyric_id} and order_number = #{current_line.order_number} and version_number = #{current_line.version_number - 1}").first

		if previous_line			
			dump_line previous_line
		else
			dump_form current_line
		end
	end

	private

		def dump_line(lyric_line)
			@lyric_line = lyric_line

			respond_to do |format|
				format.html { redirect_to request.referer }
				format.js { render 'create' }
			end
		end

		def dump_form(lyric_line)
			@lyric_line = lyric_line

			respond_to do |format|
				format.html { redirect_to request.referer }
				format.js { render 'new' }
			end
		end

end
