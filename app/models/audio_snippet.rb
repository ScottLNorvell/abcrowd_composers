class AudioSnippet < ActiveRecord::Base
  # divide into scores for organization purposes
  attr_accessible :completion_score, :instrumentation, :lyric_version_id, :melody, 
  								:melody_with_lyrics, :refrain, :source, :source_url, :type, 
  								:user_id, :verse, :likes
end
