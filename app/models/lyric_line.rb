# == Schema Information
#
# Table name: lyric_lines
#
#  id             :integer          not null, primary key
#  text           :text
#  lyric_id       :integer
#  order_number   :float
#  version_number :integer
#  likes          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LyricLine < ActiveRecord::Base
	# practical and relational attr's
	attr_accessible :text, :lyric_id
	# ordering attrs 
  attr_accessible :likes, :order_number, :version_number
  belongs_to :lyric
  has_and_belongs_to_many :lyric_versions

  after_initialize :init 

  def init
  	self.likes ||= 0
  	self.version_number ||= 0
  end

end
