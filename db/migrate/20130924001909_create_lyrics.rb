class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.integer :topic_id

      t.timestamps
    end
  end
end
