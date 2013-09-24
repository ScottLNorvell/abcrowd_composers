class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  	def soundcloud_client(user=nil)
  		client = SoundCloud.new client_id: ENV['ABCROWD_SC_CLIENT_ID'], client_secret: ENV['ABCROWD_SC_CLIENT_SECRET']
  		client.access_token = user.access_token if user
  		return client 
  	end
  	
end
