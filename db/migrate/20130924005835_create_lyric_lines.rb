class CreateLyricLines < ActiveRecord::Migration
  def change
    create_table :lyric_lines do |t|
      t.text :text
      t.integer :lyric_id
      t.float :order_number
      t.integer :version_number
      t.float :likes

      t.timestamps
    end
  end
end
