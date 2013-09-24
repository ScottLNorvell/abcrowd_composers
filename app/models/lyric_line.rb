class LyricLine < ActiveRecord::Base
  attr_accessible :likes, :lyric_id, :order_number, :text, :version_number
end
