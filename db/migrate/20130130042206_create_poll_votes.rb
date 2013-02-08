class CreatePollVotes < ActiveRecord::Migration
  def change
    create_table :poll_votes do |t|
      t.references :poll
      t.references :poll_option
      t.references :user
      t.timestamps
    end
    add_index :poll_votes, [:poll_id, :user_id], unique: :true
  end
end
