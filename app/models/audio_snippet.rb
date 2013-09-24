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

## ********** Need TITLE *******************
class AudioSnippet < ActiveRecord::Base
  # divide into scores for organization purposes
  # relationship id's
  attr_accessible :topic_id, :user_id, :lyric_version_id
  # scores for classification purposes
  attr_accessible :refrain,  :melody, :melody_with_lyrics, :verse
  # scores for ranking
  attr_accessible :completion_score, :likes
  # general qualities								
 	attr_accessible :title, :instrumentation, :source, :source_url, :type 
 	# relationships
  belongs_to :lyric_version
  belongs_to :topic 

  after_initialize :init 

  def init
  	# set ranking defaults
  	if self.type == 'full'
  		self.completion_score = 5
  	else
  		self.completion_score = 1
  	end

  	self.likes ||= 0
  	# set classification defaults
  	self.melody ||= 0
  	self.melody_with_lyrics ||=0
  	self.refrain ||= 0
  	self.verse ||= 0
  end
end
