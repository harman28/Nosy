require 'sinatra'
require 'sinatra/activerecord'

require './models/update' #Update class
require './config/environments' #database configuration

get '/' do
  "Things appear to be okay."
end

get '/updates' do
  Update.all.to_json
end

post '/updates' do
  p params
  update_attrs = params.with_indifferent_access.slice(:team_id, :user_id, :user_name, :text)
  @update = Update.new(update_attrs)
  if @update.save
    @update.to_json
  else
    status 400
    @update.errors.to_json
  end
end