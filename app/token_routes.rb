
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