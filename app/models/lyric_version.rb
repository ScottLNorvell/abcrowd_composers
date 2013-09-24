class LyricVersion < ActiveRecord::Base
  attr_accessible :likes, :lyric_id, :text, :title, :version_stream
end
