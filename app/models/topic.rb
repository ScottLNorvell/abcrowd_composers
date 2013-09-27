# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  attr_accessible :subject_id, :title
  belongs_to :subject 
  has_many :lyrics
  has_many :audio_snippets

  def definitive_song
    # might need to be re-written
  	audio_snippets.order('completion_score DESC').first
  end

  def definitive_lyric
    # might need to be re-written
  	lyrics.order('likes DESC').first
  end

end
