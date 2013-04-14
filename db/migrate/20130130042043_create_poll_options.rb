class CreatePollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.integer :color
      t.text :label
      t.references :poll
      t.string :url

      t.timestamps
    end
  end
end
