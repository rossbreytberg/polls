class PollOption < ActiveRecord::Base
  attr_accessible :color, :label, :poll_id
  belongs_to :poll
  has_many :poll_votes, dependent: :destroy
  before_create :set_default_color

  def color
    "#%06x" % read_attribute(:color)
  end

  def color=(color)
    write_attribute :color, color[1..-1].to_i(16)
  end

  private
    def set_default_color
      self.color ||= 0
    end
end
