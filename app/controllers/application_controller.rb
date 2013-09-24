class ApplicationController < ActionController::Base
  protect_from_forgery

  private 
  	def soundcloud_client(user=nil)
  		SoundCloud.new client_id: ENV['ABCROWD_SC_CLIENT_ID'], 
  									 client_secret: ENV['ABCROWD_SC_CLIENT_SECRET'],
  									 access_token: user.access_token if user
  	end
end
