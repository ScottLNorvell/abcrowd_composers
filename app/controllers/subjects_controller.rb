class SubjectsController < ApplicationController
	
	# show all subjects. 'new' form will be on page as well
	def index
		@subjects = Subject.all 
		@subject = Subject.new
		session[:subject] = session[:topic] = nil
	end

	# def show
	# 	@subject = Subject.find params[:id]
	# 	@topics = @subject.topics.all
	# 	@topic = @subject.topics.new
	# end

	def create
		Subject.create params[:subject]
		redirect_to subjects_path
	end

	#only as admin
	def destroy
		
	end
end
