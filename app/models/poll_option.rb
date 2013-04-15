class PollOption < ActiveRecord::Base
  attr_accessible :color, :label, :poll_id, :url
  belongs_to :poll
  has_many :poll_votes, dependent: :destroy
  validates :color, presence: { message: "was left blank!" }
  validates :label, presence: { message: "was left blank!" }
end
