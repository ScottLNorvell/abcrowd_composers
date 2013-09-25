class SubjectsController < ApplicationController
	
	# show all subjects. 'new' form will be on page as well
	def index
		@subjects = Subject.all 
		@subject = Subject.new
	end

	def create
		
	end

	#only as admin
	def destroy
		
	end
end
