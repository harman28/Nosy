require './config/constants'

class Token < ActiveRecord::Base
  validates :value, presence: true, uniqueness: true

  after_save :add_to_recognized

  def add_to_recognized
    File.open(RECOGNIZED_TOKENS_FILE,'w') do |f|
      f.puts(self.value)
    end
  end
end