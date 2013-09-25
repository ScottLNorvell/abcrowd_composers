class SubjectsController < ApplicationController
	
	# show all subjects. 'new' form will be on page as well
	def index
		@subjects = Subject.all 
		@subject = Subject.new
	end

	def create
		Subject.create params[:subject]
		redirect_to subjects_path
	end

	#only as admin
	def destroy
		
	end
end
