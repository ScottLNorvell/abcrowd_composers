class CreateAudioSnippets < ActiveRecord::Migration
  def change
    create_table :audio_snippets do |t|
      t.string :type
      t.float :melody
      t.float :melody_with_lyrics
      t.float :verse
      t.float :refrain
      t.integer :lyric_version_id
      t.string :instrumentation
      t.string :source
      t.string :source_url
      t.integer :user_id
      t.float :completion_score
      t.float :likes

      t.timestamps
    end
  end
end
