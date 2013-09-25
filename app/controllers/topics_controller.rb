class TopicsController < ApplicationController
	def index
		@subject = Subject.find params[:id]
		@topics = @subject.topics.all
		@topic = @subject.topics.new
	end

	def show
		@topic = Topic.find params[:id]
		
	end

	def create
		
	end

	def destroy
		
	end
end
