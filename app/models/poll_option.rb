class PollOption < ActiveRecord::Base
  attr_accessible :label, :poll_id

  belongs_to :poll
  has_many :poll_votes, dependent: :destroy
end
