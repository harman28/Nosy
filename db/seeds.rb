require './config/constants'

tokens = File.read(RECOGNIZED_TOKENS_FILE).split("\n")

tokens.each do |token|
  Token.find_or_create_by(value: token)
end