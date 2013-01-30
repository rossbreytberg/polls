class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :question
      t.string :option_1
      t.string :option_2
      t.integer :option_1_count
      t.integer :option_2_count
      t.integer :user_id

      t.timestamps
    end
  end
end
