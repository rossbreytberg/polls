class Poll < ActiveRecord::Base
  attr_accessible :content, :question, :user_id
  validates :user_id, presence: { message: "must be logged in to create poll!" }
  has_many :poll_options
  has_many :poll_votes
  belongs_to :user
end
