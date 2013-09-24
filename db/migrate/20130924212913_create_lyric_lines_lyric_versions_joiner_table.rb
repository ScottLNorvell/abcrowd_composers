class CreateLyricLinesLyricVersionsJoinerTable < ActiveRecord::Migration
  def change
  	create_table :lyric_lines_lyric_versions, id: false do |t|
  		t.integer :lyric_line_id
  		t.integer :lyric_version_id
  	end
  end
end
