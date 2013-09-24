class AddTitleToAudioSnippet < ActiveRecord::Migration
  def change
  	add_column :audio_snippets, :title, :string
  end
end
