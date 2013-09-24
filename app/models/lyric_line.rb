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
  attr_accessible :likes, :lyric_id, :order_number, :text, :version_number
  belongs_to :lyric
end
