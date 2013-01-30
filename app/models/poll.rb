class Poll < ActiveRecord::Base
  attr_accessible :option_1, :option_1_count, :option_2, :option_2_count, :question, :user_id

  belongs_to :user
  has_many :votes
end
