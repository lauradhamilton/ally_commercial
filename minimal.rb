require 'rubygems'
require 'sinatra'
require 'active_record'
#require './config/environments';


get '/' do
  haml :index
end

get '/videos' do
  haml :videos
end

class Videos
	def initialize(key, secret, callback)
		@key = key
		@secret = secret
		@callback = callback

		@base_url = "https://api.tout.com/api/v1/search/users"
		@scope = @base_url
		@request_token_url    = "/accounts/OAuthGetRequestToken"
    	@authorize_token_url  = "/accounts/OAuthAuthorizeToken"
    	@access_token_url     = "/accounts/OAuthGetAccessToken"
  end
end

@videofeed = Videos.new("anonymous", "anonymous","http://localhost:4567")

puts @videofeed