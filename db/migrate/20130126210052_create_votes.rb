class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :poll_id
      t.integer :option

      t.timestamps
    end
  end
end
