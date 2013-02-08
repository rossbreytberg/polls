class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :question
      t.text :content
      t.references :user
      t.timestamps
    end
  end
end
