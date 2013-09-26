# == Schema Information
#
# Table name: lyric_versions
#
#  id             :integer          not null, primary key
#  lyric_id       :integer
#  version_stream :text
#  title          :string(255)
#  text           :text
#  likes          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LyricVersion < ActiveRecord::Base
  attr_accessible :likes, :lyric_id, :text, :title, :version_stream
  belongs_to :lyric 
  has_many :audio_snippets
  has_and_belongs_to_many :lyric_lines

  after_initialize :init

  def lines_in_order
  	lyric_lines.order('order_number')
  end

  def add_lines(line_ids)

    line_ids.each do |line_id|
      lyric_lines << LyricLine.find(line_id)
    end
    
  end

  def init
  	self.likes ||= 1
  end

end
