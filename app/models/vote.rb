class Vote < ActiveRecord::Base
  attr_accessible :option, :poll_id, :user_id

  belongs_to :user
  belongs_to :poll
end
