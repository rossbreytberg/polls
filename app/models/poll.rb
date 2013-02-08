class Poll < ActiveRecord::Base
  attr_accessible :content, :question, :poll_options_attributes, :user_id
  validates :user_id, presence: { message: "must be logged in to create poll!" }
  has_many :poll_options, dependent: :destroy
  has_many :poll_votes
  belongs_to :user
  accepts_nested_attributes_for :poll_options
end
