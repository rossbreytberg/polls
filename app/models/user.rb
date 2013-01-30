class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  before_save :create_remember_token
  validates_uniqueness_of :name, case_sensitive: false
  has_many :polls
  has_many :votes
  def self.find_by_name(name)
    self.where("lower(name) = ?", name).first
  end
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
