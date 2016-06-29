require 'sinatra'
require 'sinatra/activerecord'

require './models/update' #Update class
require './models/token' #Tokens
require './config/environments' #database configuration

require './config/constants'

before do
  if request.path_info.include? 'tokens'
    check_access_key
  else
    check_token
  end
end

get '/updates' do
  team_id = params.with_indifferent_access[:team_id]
  if team_id.present?
    prepare_summary(team_id)
  else
    halt 400, "Whoops. Send a team_id"
  end
end

post '/updates' do
  create_attrs = params.with_indifferent_access.slice(:team_id, :user_id, :user_name, :text)
  update = Update.new(create_attrs)
  if update.save
    update.to_json
  else
    halt 400, @update.errors.to_json
  end
end

get '/tokens' do
  Token.all.to_json
end

post '/tokens' do
  value = params.with_indifferent_access[:token]
  token = Token.new(value: value)
  if token.save
    token.to_json
  else
    halt 400, token.errors.to_json
  end
end

private

def check_access_key
  access_key = params.with_indifferent_access[:access_key]
  if access_key != ACCESS_KEY
    halt 401, "Unauthorized"
  end
end

def prepare_summary team_id
  summary = ["Team Updates:"]
  Update.where(team_id:team_id).find_each do |up|
    summary << "#{up.user_name}: #{up.text}"
  end
  summary.join('\n')
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