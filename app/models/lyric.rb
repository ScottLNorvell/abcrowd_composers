# == Schema Information
#
# Table name: lyrics
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lyric < ActiveRecord::Base
  attr_accessible :topic_id, :title, :likes
  has_many :lyric_versions
  has_many :lyric_lines
  belongs_to :topic

  after_initialize :init 

  def definitive_version
  	lyric_versions.order('likes').first
  end

  def init
  	self.likes ||= 1
  end
end
