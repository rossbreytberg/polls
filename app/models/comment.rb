class Comment < ActiveRecord::Base
  attr_accessible :content, :poll_id, :user_id
  belongs_to :poll
  belongs_to :user
  validates :poll_id, presence: :true
  validates :user_id, presence: :true

  def color
    poll_vote = PollVote.find_by_poll_id_and_user_id(self.poll_id, self.user_id)
    if !poll_vote.nil?
      poll_vote.poll_option.color
    end
  end

end
