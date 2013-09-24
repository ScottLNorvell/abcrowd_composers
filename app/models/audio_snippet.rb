# == Schema Information
#
# Table name: audio_snippets
#
#  id                 :integer          not null, primary key
#  type               :string(255)
#  melody             :float
#  melody_with_lyrics :float
#  verse              :float
#  refrain            :float
#  lyric_version_id   :integer
#  instrumentation    :string(255)
#  source             :string(255)
#  source_url         :string(255)
#  user_id            :integer
#  completion_score   :float
#  likes              :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class AudioSnippet < ActiveRecord::Base
  # divide into scores for organization purposes
  attr_accessible :completion_score, :topic_id, :instrumentation, :lyric_version_id, :melody, 
  								:melody_with_lyrics, :refrain, :source, :source_url, :type, 
  								:user_id, :verse, :likes
  belongs_to :lyric_version
  belongs_to :topic 
end
