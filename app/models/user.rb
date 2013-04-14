class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  before_create :create_remember_token
  validates :name, presence: { message: "can't be blank." }
  validates :name, uniqueness: { case_sensitive: false, message: "already in use." }
  has_many :comments
  has_many :polls
  has_many :poll_votes
  def self.find_by_name(name)
    self.where("lower(name) = ?", name).first
  end
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
