class PollOption < ActiveRecord::Base
  attr_accessible :color, :label, :poll_id
  belongs_to :poll
  has_many :poll_votes, dependent: :destroy
  validates :color, presence: { message: "was left blank!" }
  validates :label, presence: { message: "was left blank!" }

  def color
    color = read_attribute(:color)
    if color.present?
      "#%06x" % color
    end
  end

  def color=(color)
    if color.present?
      write_attribute :color, color[1..-1].to_i(16)
    end
  end

end
