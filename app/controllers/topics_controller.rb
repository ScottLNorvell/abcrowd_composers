class TopicsController < ApplicationController
	def index
		@subject = Subject.find params[:id]
		session[:subject] = @subject.title
		session[:topic] = nil 
		@topics = @subject.topics.all
		@topic = @subject.topics.new
	end

	def show
		@topic = Topic.find params[:id]
		session[:topic] = @topic.title
		@song = @topic.definitive_song
		@lyric = @topic.definitive_lyric
		
	end

	def create
		topic = Topic.create params[:topic]
		redirect_to topic_path topic
	end

	def destroy
		topic = Topic.find params[:id]
		topic.destroy
	end
end
