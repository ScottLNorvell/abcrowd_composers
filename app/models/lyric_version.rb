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
end
