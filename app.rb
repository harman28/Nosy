require 'sinatra'
require 'sinatra/activerecord'

require './models/update' #Update class
require './models/token' #Tokens
require './config/environments' #database configuration

require './config/constants'

require './app/token_routes'
require './app/update_routes'
require './app/user_routes'

before do
  content_type 'application/json'

  if request.path_info.include? 'tokens'
    check_access_key
  else
    check_token
  end
end

private

def check_access_key
  access_key = params.with_indifferent_access[:access_key]
  if access_key != ACCESS_KEY
    halt 401, "Unauthorized"
  end
end

def check_token
  token = params.with_indifferent_access[:token]
  if token.nil? or not validToken? token
    halt 401, "Unauthorized token"
  end
end

def validToken? token
  Token.exists?(value:token)
end