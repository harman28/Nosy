tokens = File.read('recognized_tokens').split("\n")

tokens.each do |token|
  Token.find_or_create_by(value: token)
end