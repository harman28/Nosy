class Update < ActiveRecord::Base
  validates :team_id, presence: true
  validates :user_id, presence: true
  validates :user_name, presence: true

  def presentable
    "*Recorded* _Week \##{self.week}_: @#{self.user_name} - #{self.text}"
  end
end