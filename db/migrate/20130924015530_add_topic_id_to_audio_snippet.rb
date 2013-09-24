class AddTopicIdToAudioSnippet < ActiveRecord::Migration
  def up
  	add_column :audio_snippets, :topic_id, :integer
  end

  def down
  	delete_column :audio_snippets, :topic_id, :integer
  end
end
