require 'sinatra'
require 'sinatra/activerecord'

require './models/update' #Update class
require './config/environments' #database configuration

get '/' do
  "Things appear to be okay."
end

get '/updates' do
  team_id = params.with_indifferent_access[:team_id]
  if team_id.present?
    prepare_summary(team_id)
  else
    status 400
    "Whoops"
  end
end

post '/updates' do
  create_attrs = params.with_indifferent_access.slice(:team_id, :user_id, :user_name, :text)
  @update = Update.new(create_attrs)
  if @update.save
    @update.to_json
  else
    status 400
    @update.errors.to_json
  end
end

def prepare_summary team_id
  summary = ["Team Updates:"]
  Update.where(team_id:team_id).find_each do |up|
    summary << "#{up.user_name}: #{up.text}"
  end
  summary.join('\n')
end