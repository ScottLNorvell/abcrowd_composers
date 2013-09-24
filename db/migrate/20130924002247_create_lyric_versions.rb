class CreateLyricVersions < ActiveRecord::Migration
  def change
    create_table :lyric_versions do |t|
      t.integer :lyric_id
      t.text :version_stream
      t.string :title
      t.text :text
      t.float :likes

      t.timestamps
    end
  end
end
