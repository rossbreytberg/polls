class CreatePollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.text :label
      t.references :poll

      t.timestamps
    end
  end
end
