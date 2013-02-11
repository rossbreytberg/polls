class Poll < ActiveRecord::Base
  attr_accessible :content, :question, :poll_options_attributes, :user_id
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :poll_options, dependent: :destroy
  has_many :poll_votes, dependent: :destroy
  validates :user_id, presence: { message: "must be logged in to create poll!" }
  accepts_nested_attributes_for :poll_options
end
