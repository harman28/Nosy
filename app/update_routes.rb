
get '/updates' do
  team_id = params.with_indifferent_access[:team_id]
  week = params.with_indifferent_access[:week]
  validate_week
  if team_id.present?
    prepare_summary(team_id, week)
  else
    halt 400, "Whoops. Send a team_id"
  end
end

post '/updates' do
  attrs = params.with_indifferent_access.slice(:team_id, :user_id, :user_name, :text)
  week = weekstamp
  update = Update.find_or_create_by(team_id: attrs[:team_id], user_id: attrs[:user_id], week: week)
  update.assign_attributes(attrs)
  if update.save
    prepare_response(update.presentable, 'ephemeral')
  else
    halt 400, @update.errors.to_json
  end
end

private

def validate_week week
  halt 400, "Invalid week" if /^[0-9]{2}-[0-9]{2}$/.match(week).nil?
end

def weekstamp
  Time.now.strftime('%W-%y')
end

def prepare_response text, response_type='ephemeral'
  response_type = 'ephemeral' if response_type != 'in_channel'
  {
    "response_type": response_type,
    "text": text
  }.to_json
end

def prepare_summary team_id, week
  week ||= weekstamp
  summary = ["*Team Updates* _Week \##{week}_:"]
  Update.where(team_id:team_id, week: week).find_each do |up|
    summary << "@#{up.user_name}: #{up.text}"
  end
  text = summary.join("\n")
  prepare_response(text, 'in_channel')
end