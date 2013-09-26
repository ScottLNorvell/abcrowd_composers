class LinesController < ApplicationController
	#before_filter :authenticate_user!
	
	include LyricFun


	def new
		lyric_line = LyricLine.find params[:id]

		dump_form lyric_line
	end 

	def update
		lyric_line = LyricLine.new params[:lyric_line]

		lyric_line.version_number = get_next_version( lyric_line )

		lyric_line.save

		@first = params[:first]

		dump_line lyric_line
	end

	def create
		lyric_line = LyricLine.new params[:lyric_line]

		lyric_line.version_number = get_next_version( lyric_line )

		lyric_line.save

		@first = params[:first]

		p params
		# this should dump whole new line

		dump_line lyric_line #, false

	end

	def cancel
		if params[:id] != 'new'
			lyric_line = LyricLine.find params[:id]
			dump_line lyric_line
		else
			@order_number = params[:order_number]
		end
	end

	def insert_line
		@first = params[:placement]['first'].to_f

		@second = params[:placement]['second'].to_f

		@new_order_number = @first + ( @second - @first ) / 2

		@lyric_id = params[:lyric_id]

		@lyric_line = LyricLine.new lyric_id: @lyric_id, order_number: @new_order_number

		@new = true

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
			if lyric_line.text.length > 2

				@lyric_line = lyric_line

				respond_to do |format|
					format.html { redirect_to request.referer }
					format.js { render 'update' }
				end
			else
				render nothing: true
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
