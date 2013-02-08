class PollVote < ActiveRecord::Base
  attr_accessible :poll_id, :poll_option_id, :user_id
  validates :poll_id, uniqueness: { scope: :user_id }
  validates :poll_id, presence: true
  validates :poll_option_id, presence: true
  validates :user_id, presence: true
  belongs_to :poll
  belongs_to :poll_option
  belongs_to :user
end
