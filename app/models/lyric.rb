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
  	likes = lyric_versions.map { |lv| [lv.likes, lv] }
    likes.max[1]
  end

  def versions_for_select
    versions = lyric_versions
    likes_order = versions.map { |lv| [lv.likes, lv] }
    likes_order.sort!.reverse!
    definitive = likes_order.first[1]
    v_for_select = likes_order.map { |likes, lv| [lv.title, lv.id] }
    v_for_select[0][0] = '- DEFINITIVE VERSION -'
    [definitive, v_for_select]
  end

  def init
  	self.likes ||= 1
  end
end
